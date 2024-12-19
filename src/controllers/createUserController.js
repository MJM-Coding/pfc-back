import User from "../models/user.js";
import { Op } from 'sequelize';
import { Scrypt } from "../auth/Scrypt.js";
import { generateToken, generateTokenForSession } from "../auth/tokenService.js";
import validator from "validator";
import Family from "../models/family.js";
import Association from "../models/association.js";
import { validatePassword } from "../validation/validatePassword.js";
import transporter from "../config/nodemailer.js";
import HttpError from "../middlewares/httperror.js";
import jwt from "jsonwebtoken";

export const createUserController = {
  //! Fonction pour créer un utilisateur
  async createUser(req, res) {
    const user = req.body;
    const familyData = req.body.family;
    const associationData = req.body.association;
  
    try {
      // Vérification de l'email
      if (!validator.isEmail(user.email)) {
        return res.status(400).json({ message: "Email invalide" });
      }
  
      // Vérification du mot de passe
      if (!validatePassword(user.password)) {
        return res.status(400).json({
          message: "Le mot de passe doit contenir au moins 8 caractères, une majuscule, un chiffre et un caractère spécial.",
        });
      }
  
      // Vérification si l'utilisateur existe déjà
      const existingUser = await User.findOne({ where: { email: user.email } });
      if (existingUser) {
        return res.status(400).json({ message: "L'email est déjà utilisé" });
      }
  
      // Hachage du mot de passe
      const hashedPassword = Scrypt.hash(user.password);
  
      let newUser, additionalData;
      if (associationData) {
        user.role = "association";
  
        newUser = await User.create({
          firstname: user.firstname,
          lastname: user.lastname,
          email: user.email,
          password: hashedPassword,
          role: user.role,
        });
  
        const newAssociation = await Association.create({
          ...associationData,
          id_user: newUser.id,
        });
        additionalData = { association: newAssociation.toJSON() };
      }
  
      if (familyData) {
        user.role = "family";
  
        newUser = await User.create({
          firstname: user.firstname,
          lastname: user.lastname,
          email: user.email,
          password: hashedPassword,
          role: user.role,
        });
  
        const newFamily = await Family.create({
          ...familyData,
          id_user: newUser.id,
        });
        additionalData = { family: newFamily.toJSON() };
      }
  
      if (!newUser) {
        throw new HttpError(400, "Merci de bien compléter toutes les informations.");
      }
  
      // Générer le token de confirmation et envoyer l'email
      await createUserController.sendConfirmationEmail(newUser);
  
      // Supprimer le mot de passe pour des raisons de sécurité
      const userData = { ...newUser.toJSON(), ...additionalData };
      delete userData.password;
  
      // Retourner uniquement un message d'inscription
      return res.status(201).json({
        message: "Inscription réussie. Un email de confirmation a été envoyé.",
        user: userData, // Retourne les détails utilisateur sans token
      });
    } catch (error) {
      console.error("Erreur lors de la création de l'utilisateur :", error);
      res.status(500).json({ error: "Erreur lors de la création de l'utilisateur." });
    }
  },
  
  //! Fonction pour envoyer un email de confirmation
  async sendConfirmationEmail(user) {
    try {
      const confirmationtoken = generateToken(user); // Générer un token pour la confirmation
      const expirationDate = new Date(Date.now() + 24 * 60 * 60 * 1000); // Expiration : 24h
  
      user.confirmationtoken = confirmationtoken;
      user.tokenexpiration = expirationDate;
      await user.save();
  
      console.log("Token sauvegardé :", user.confirmationtoken);
  
      // Générer l'URL de confirmation
      const confirmationUrl = `${process.env.FRONTEND_URL}/confirm-email/${confirmationtoken}`;
      console.log("URL de confirmation :", confirmationUrl);
  
      // Envoyer l'email
      await transporter.sendMail({
        from: process.env.EMAIL_USER,
        to: user.email,
        subject: "Confirmation de votre inscription",
        html: `
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
`,

      
      
      
      
      });
  
      console.log("Email envoyé avec succès.");
    } catch (error) {
      console.error("Erreur lors de l'envoi de l'email de confirmation :", error);
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
            return res.status(400).json({ message: "Le jeton a expiré." });
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
}
};

export default createUserController;
