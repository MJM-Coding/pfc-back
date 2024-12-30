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

//! Méthode pour connecter un utilisateur
export const signinController = {
    async signinUser(req, res) {
      let { email, password } = req.body;
  
      // Nettoyage et normalisation
      email = email.trim().toLowerCase();
      password = password.trim();
  
      if (!email || !password) {
        return res.status(400).json({ message: "Email et mot de passe sont requis." });
      }
  
      if (!validator.isEmail(email)) {
        return res.status(400).json({ message: "Email invalide." });
      }
  
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
  
      //  Vérifier si l'utilisateur a dépassé le nombre de tentatives autorisées
      if (user.failed_attempts >= 5) {
        return res.status(403).json({ message: "Compte bloqué. Veuillez réinitialiser votre mot de passe." });
      }
  
      if (!user.isverified) {
        return res.status(403).json({ message: "Veuillez confirmer votre email avant de vous connecter." });
      }
  
      const isValidPassword = await Scrypt.compare(password, user.password);
      if (!isValidPassword) {
        // Incrémenter les tentatives de connexion en cas d'échec
        user.failed_attempts += 1;
        await user.save();
        return res.status(401).json({ message: "Identifiants ou mot de passe incorrects." });
      }
  
      // Réinitialiser les tentatives après une connexion réussie
      user.failed_attempts = 0;
      user.last_login = new Date();
      await user.save();
  
      const id_family = user.family?.id || null;
      const id_association = user.association?.id || null;
  
      const token = generateTokenForSession({
        id: user.id,
        email: user.email,
        role: user.role,
        id_family,
        id_association,
      });
  
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
          representative: user.association?.representative || null,
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
