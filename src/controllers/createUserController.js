import User from "../models/user.js";
import { Op } from "sequelize";
import { Scrypt } from "../auth/Scrypt.js";
import {
  generateConfirmationToken,
  generateTokenForSession,
} from "../auth/tokenService.js";
import validator from "validator";
import Family from "../models/family.js";
import Association from "../models/association.js";
import { validatePassword } from "../validation/validatePassword.js";
import { sendEmail } from "../utils/mailer.js"; // fonction pour envoyer un email
import HttpError from "../middlewares/httperror.js";
import jwt from "jsonwebtoken";
import sequelize from "../models/client.js"; // pour la transaction
import { validateRNAFromApi } from "../utils/validateRNA.js"; // fonction de validation du numéro RNA

export const createUserController = {
  async createUser(req, res) {
    // Démarrage d'une transaction pour s'assurer que toutes les opérations d'insertion
    // se déroulent correctement ou qu'elles sont annulées en cas d'erreur
    const transaction = await sequelize.transaction();

    try {
      // Récupération des données du corps de la requête
      const user = req.body; // Données générales de l'utilisateur
      const familyData = req.body.family; // Données spécifiques aux familles d'accueil
      const associationData = req.body.association; // Données spécifiques aux associations

      //! Vérification de l'email
      // On s'assure que l'email est valide au format standard
      if (!validator.isEmail(user.email)) {
        return res.status(400).json({ message: "Email invalide" });
      }

      //! Vérification du mot de passe
      // On s'assure que le mot de passe respecte les critères définis
      if (!validatePassword(user.password)) {
        return res.status(400).json({
          message:
            "Le mot de passe doit contenir au moins 8 caractères, une majuscule, un chiffre et un caractère spécial.",
        });
      }

      //! Vérification de l'existence de l'utilisateur
      // On vérifie si un utilisateur avec cet email existe déjà dans la base de données
      const existingUser = await User.findOne({ where: { email: user.email } });
      if (existingUser) {
        return res.status(400).json({ message: "L'email est déjà utilisé" });
      }

      //! Vérification de l'existence du numéro RNA
      if (associationData?.rna_number) {
        // On vérifie si un numéro RNA existe déjà dans la table `Association`
        const existingAssociation = await Association.findOne({
          where: { rna_number: associationData.rna_number },
        });

        if (existingAssociation) {
          // Message clair en cas de conflit avec un RNA déjà existant
          return res.status(400).json({
            message:
              "Ce numéro RNA est déjà associé à un compte existant. Si vous êtes le représentant de cette association, veuillez vous connecter ou réinitialiser votre mot de passe.",
          });
        }
      }

      //! Validation du numéro RNA via l'API externe
      if (associationData && associationData.rna_number) {
        // On appelle une fonction pour valider le numéro RNA auprès d'une API externe
        const rnaResponse = await validateRNAFromApi(
          associationData.rna_number
        );
        if (!rnaResponse.valid) {
          // Si le RNA est invalide, on renvoie une erreur
          return res.status(400).json({ message: rnaResponse.message });
        }
      }

      //! Hachage du mot de passe
      // Le mot de passe est haché avant d'être stocké pour garantir sa sécurité
      const hashedPassword = await Scrypt.hash(user.password);

      let newUser, additionalData;

      //! Insertion pour les associations
      if (associationData) {
        user.role = "association"; // On attribue le rôle "association" à l'utilisateur

        // Création d'un utilisateur dans la table `User`
        newUser = await User.create(
          {
            firstname: user.firstname,
            lastname: user.lastname,
            email: user.email,
            password: hashedPassword,
            role: user.role,
          },
          { transaction } // La transaction garantit que tout est cohérent
        );

        // Création d'une association liée à l'utilisateur créé
        const newAssociation = await Association.create(
          {
            ...associationData, // Données spécifiques à l'association
            id_user: newUser.id, // Association avec l'utilisateur
          },
          { transaction }
        );

        // Stockage des données de l'association pour les inclure dans la réponse
        additionalData = { association: newAssociation.toJSON() };
      }

      //! Insertion pour les familles d'accueil
      if (familyData) {
        user.role = "family"; // On attribue le rôle "family" à l'utilisateur

        // Création d'un utilisateur dans la table `User`
        newUser = await User.create(
          {
            firstname: user.firstname,
            lastname: user.lastname,
            email: user.email,
            password: hashedPassword,
            role: user.role,
          },
          { transaction } // La transaction garantit que tout est cohérent
        );

        // Création d'une famille liée à l'utilisateur créé
        const newFamily = await Family.create(
          {
            ...familyData, // Données spécifiques à la famille
            id_user: newUser.id, // Association avec l'utilisateur
          },
          { transaction }
        );

        // Stockage des données de la famille pour les inclure dans la réponse
        additionalData = { family: newFamily.toJSON() };
      }

      // Si aucun utilisateur n'est créé (problème dans les données), on lève une erreur
      if (!newUser) {
        throw new Error("Merci de bien compléter toutes les informations.");
      }

      //! Validation de la transaction
      // Toutes les insertions sont validées et sauvegardées définitivement
      await transaction.commit();

      // Envoi d'un email de confirmation à l'utilisateur
      await createUserController.sendConfirmationEmail(newUser);

      // On prépare les données utilisateur pour la réponse (sans le mot de passe)
      const userData = { ...newUser.toJSON(), ...additionalData };
      delete userData.password;

      // Retourner une réponse de succès avec les informations utilisateur
      return res.status(201).json({
        message: "Inscription réussie. Un email de confirmation a été envoyé.",
        user: userData,
      });
    } catch (error) {
      //! Annulation de la transaction**
      // Si une erreur survient, toutes les insertions sont annulées
      await transaction.rollback();

      console.error("Erreur lors de la création de l'utilisateur :", error);
      res
        .status(500)
        .json({ error: "Erreur lors de la création de l'utilisateur." });
    }
  },

  //! Fonction pour envoyer un email de confirmation
  async sendConfirmationEmail(user) {
    try {
      const confirmationtoken = generateConfirmationToken(user); // Générer un token pour la confirmation
      const expirationDate = new Date(Date.now() + 24 * 60 * 60 * 1000); // Expiration : 24h

      user.confirmationtoken = confirmationtoken;
      user.tokenexpiration = expirationDate;
      await user.save();

      console.log("Token sauvegardé :", user.confirmationtoken);

      // Générer l'URL de confirmation
      const confirmationUrl = `${process.env.FRONTEND_URL}/confirm-email/${confirmationtoken}`;
      console.log("URL de confirmation :", confirmationUrl);

      // Envoyer l'email en utilisant `sendEmail`
      await sendEmail(
        user.email,
        "Confirmation de votre inscription",
        `
        <table width="100%" style="font-family: Arial, sans-serif; line-height: 1.5; color: #333; background-color: #f9f9f9; padding: 20px; margin: 0;">
          <tr>
            <td align="center">
              <table width="600" style="max-width: 600px; margin: auto; background-color: #07091E; color: #fff; border-radius: 8px; overflow: hidden; border-spacing: 0;">
                <!-- Titre en haut -->
                <tr>
                  <td style="padding: 20px; text-align: center; background-color: #07091E; color: #fff;">
                    <h1 style="margin: 0; font-size: 28px; color: #fff;">Bienvenue, ${user.firstname} !</h1>
                  </td>
                </tr>
                <!-- Bannière avec image -->
                <tr>
                  <td style="padding: 0; text-align: center; background-color: #000;">
                    <img src="https://res.cloudinary.com/depggx3rv/image/upload/v1733667774/confirmation%20mail/udrkziv5veomktffjtj3.png" 
                        alt="Confirmation Mail"
                        role="presentation"
                        style="width: 100%; height: auto; display: block; border-top-left-radius: 8px; border-top-right-radius: 8px;">
                  </td>
                </tr>
                <!-- Texte principal -->
                <tr>
                  <td style="padding: 20px; background-color: #07091E; color: #fff; text-align: center;">
                    <p style="margin: 0 0 10px;">Merci de vous être inscrit sur notre site Pet Foster Connect.</p>
                    <p style="margin: 0 0 20px;">Cliquez sur le lien suivant pour confirmer votre email :</p>
                    <a href="${confirmationUrl}" 
                        style="display: inline-block; padding: 10px 20px; color: #fff; background-color: #007BFF; text-decoration: none; border-radius: 5px;">Confirmer mon email</a>
                    <p style="margin-top: 20px; font-size: 12px; color: #aaa;">Ce lien expirera dans 24 heures.</p>
                  </td>
                </tr>
                <!-- Message "Ne pas répondre" -->
                <tr>
                  <td style="padding: 10px; background-color: #07091E; text-align: center; color: #aaa; font-size: 12px;">
                    <p style="margin: 0;">Veuillez ne pas répondre à cet email. Ce message est généré automatiquement.</p>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        `
      );

      console.log("Email envoyé avec succès.");
    } catch (error) {
      console.error(
        "Erreur lors de l'envoi de l'email de confirmation :",
        error
      );
    }
  },

  //! Fonction pour confirmer un email
  async confirmEmail(req, res) {
    const { token } = req.params;

    console.log("Token reçu :", token);

    // Décoder le token JWT
    let decoded;
    try {
      decoded = jwt.verify(token, process.env.JWT_SECRET);
    } catch (error) {
      console.error("Erreur lors de la vérification du token :", error);
      if (error.name === "TokenExpiredError") {
        return res.status(401).json({ message: "Le jeton a expiré." });
      }
      return res.status(400).json({ message: "Jeton invalide." });
    }

    console.log("Payload décodé :", decoded);

    // Rechercher l'utilisateur
    const user = await User.findOne({
      where: {
        id: decoded.id,
        email: decoded.email,
        confirmationtoken: token,
        tokenexpiration: { [Op.gt]: new Date() },
      },
    });

    if (!user) {
      console.error("Utilisateur non trouvé ou jeton invalide/expiré.");
      return res.status(400).json({ message: "Jeton invalide ou expiré." });
    }

    console.log("Avant confirmation :", user.toJSON());

    // Mettre à jour l'utilisateur
    user.isverified = true;
    user.confirmationtoken = null;
    user.tokenexpiration = null;

    await user.save();

    console.log("Après confirmation :", user.toJSON());

    // Générer un token de session après confirmation
    const sessionToken = generateTokenForSession(user);

    return res.status(200).json({
      message: "Votre email a été confirmé avec succès !",
      token: sessionToken, // Token pour la session
    });
  },
};

export default createUserController;
