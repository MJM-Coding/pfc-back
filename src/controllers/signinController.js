import jwt from "jsonwebtoken"; // Gestion des JWT
import { Family, Association, User } from "../models/index.js"; // Import des modèles
import { Scrypt } from "../auth/Scrypt.js"; // Gestion des mots de passe
import { generateTokenForSession } from "../auth/tokenService.js"; // Token JWT
import validator from "validator"; // Validation d'email

const JWT_SECRET = process.env.JWT_SECRET;

if (!JWT_SECRET) {
  console.error("JWT_SECRET n'est pas défini.");
  throw new Error("JWT_SECRET est requis.");
}

export const signinController = {
  //! Méthode pour connecter un utilisateur
  async signinUser(req, res) {
    let { email, password } = req.body;

    // Nettoyage des entrées
    email = email.trim();
    password = password.trim();

    // Vérification de la présence de l'email et du mot de passe
    if (!email || !password) {
      return res.status(400).json({ message: "Email et mot de passe sont requis." });
    }

    // Vérification de la validité de l'email
    if (!validator.isEmail(email)) {
      return res.status(400).json({ message: "Email invalide." });
    }

    try {
      // Rechercher l'utilisateur
      const user = await User.findOne({
        where: { email },
        include: [
          { model: Family, as: "family", required: false },
          { model: Association, as: "association", required: false },
        ],
      });

      if (!user) {
        return res.status(401).json({ message: "Identifiants ou mot de passe incorrects." });
      }

      // Vérification de la confirmation de l'email
      if (!user.isverified) {
        return res.status(403).json({
          message: "Veuillez confirmer votre email avant de vous connecter.",
        });
      }

      // Vérification du mot de passe
      const isValidPassword = await Scrypt.compare(password, user.password);
      if (!isValidPassword) {
        return res.status(401).json({ message: "Identifiants ou mot de passe incorrects." });
      }

      // Récupération des IDs associés
      const id_family = user.family ? user.family.id : null;
      const id_association = user.association ? user.association.id : null;

      // Génération du token JWT pour la session
      const token = generateTokenForSession({
        id: user.id,
        email: user.email,
        role: user.role,
        id_family,
        id_association,
      });

      console.log("Utilisateur connecté :", {
        id: user.id,
        email: user.email,
        role: user.role,
        id_family,
        id_association,
      });

      // Réponse au client
      return res.status(200).json({
        message: "Connexion réussie.",
        token,
        user: {
          firstname: user.firstname,
          email: user.email,
          role: user.role,
          id: user.id,
          id_family,
          id_association,
          representative: user.association ? user.association.representative : null,
        },
      });
    } catch (error) {
      console.error("Erreur lors de la connexion :", error);
      return res.status(500).json({ message: "Erreur serveur. Veuillez réessayer plus tard." });
    }
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
        id_family: decoded.id_family,
        id_association: decoded.id_association,
      });

      return res.status(200).json({ token: newToken });
    } catch (error) {
      console.error("Erreur lors du rafraîchissement du token :", error);
      return res.status(401).json({ message: "Token invalide ou expiré." });
    }
  },
};

export default signinController;
