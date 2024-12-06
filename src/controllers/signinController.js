import User from "../models/user.js";
import { Scrypt } from "../auth/Scrypt.js";
import { generateTokenForSession } from "../auth/tokenService.js";
import validator from "validator";
import jwt from "jsonwebtoken";

const JWT_SECRET = process.env.JWT_SECRET;

export const signinController = {
  //! Méthode pour connecter un utilisateur
  async signinUser(req, res) {
    let { email, password } = req.body;

    email = email.trim();
    password = password.trim();

    // Vérification de la présence de l'email et du mot de passe
    if (!email || !password) {
      return res.status(400).json({ message: "Email et mot de passe sont requis" });
    }

    // Vérification de la validité de l'email
    if (!validator.isEmail(email)) {
      return res.status(400).json({ message: "Email invalide" });
    }

    // Rechercher l'utilisateur par email
    const user = await User.findOne({
      where: { email },
      include: ["family", "association"],
    });

    if (!user) {
      return res.status(401).json({ message: "Identifiants ou mot de passe incorrect" });
    }

    // Vérifier si l'email a été confirmé
    if (!user.isverified) { // Assurez-vous que le champ est bien 'isverified'
      return res.status(403).json({
        message: "Veuillez confirmer votre email pour vous connecter.",
      });
    }

    // Vérification du mot de passe
    const isValidPassword = await Scrypt.compare(password, user.password);
    if (!isValidPassword) {
      return res.status(401).json({ message: "Identifiants ou mot de passe incorrect" });
    }

    // Génération du token JWT pour la session
    const token = generateTokenForSession(user);

    // Récupération des données d'association si elles existent
    const association = user.association;

    // Réponse avec les détails utilisateur
    res.status(200).json({
      message: "Connexion réussie",
      token,
      user: {
        firstname: user.firstname,
        email: user.email,
        role: user.role,
        id: user.id,
        id_family: user.family ? user.family.id : null,
        id_association: user.association ? user.association.id : null,
        representative: association ? association.representative : null,
      },
    });
  },

  //! Méthode pour rafraîchir le token JWT
  async refreshToken(req, res) {
    const { token } = req.body; 

    try {
      const decoded = jwt.verify(token, JWT_SECRET); 

      const newToken = generateTokenForSession({
        id: decoded.id,
        email: decoded.email,
        role: decoded.role,
      });
      
      return res.status(200).json({ token: newToken });
    } catch (error) {
      console.error("Erreur lors du rafraîchissement du token :", error);
      return res.status(401).json({ message: "Token invalide ou expiré." });
    }
  }
};

export default signinController;