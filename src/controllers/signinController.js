import User from "../models/user.js";
import { Scrypt } from "../auth/Scrypt.js";
import { generateTokenForSession } from "../auth/tokenService.js";
import validator from "validator";
import jwt from "jsonwebtoken";
import { Family, Association } from "../models/index.js";

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

    // Rechercher l'utilisateur par email avec les associations de Family et Association
    const user = await User.findOne({
      where: { email },
      include: [
        {
          model: Family,  // Inclure la table Family si l'utilisateur est une famille
          as: 'family',  // Utilise l'alias 'family' ici
          required: false, // L'utilisateur peut ne pas être une famille
        },
        {
          model: Association,  // Inclure la table Association si l'utilisateur est une association
          as: 'association',  // Utilise l'alias 'association' ici
          required: false, // L'utilisateur peut ne pas être une association
        }
      ]
    });

    if (!user) {
      return res.status(401).json({ message: "Identifiants ou mot de passe incorrect" });
    }

    // Vérification du mot de passe
    const isValidPassword = await Scrypt.compare(password, user.password);
    if (!isValidPassword) {
      return res.status(401).json({ message: "Identifiants ou mot de passe incorrect" });
    }
console.log("ID de la famille de l'utilisateur:", user.family ? user.family.id : null);  // Vérifie que id_family est bien récupéré

    // Génération du token JWT pour la session
    const token = generateTokenForSession(user);

  // Si id_family est null, essayer de récupérer la famille associée
  let id_family = user.family ? user.family.id : null;
  let id_association = user.association ? user.association.id : null;

  // Si id_family est toujours null (l'utilisateur est une famille mais sans demande), récupérer depuis la table `family`
  if (!id_family && user.role === 'family') {
    const family = await Family.findOne({ where: { id_user: user.id } });
    id_family = family ? family.id : null; // Si une famille existe pour cet utilisateur, on récupère l'ID
  }

  console.log('User Family:', user.family);  // Ajoute cette ligne pour voir les données de la famille associée
    // Réponse avec les détails utilisateur
    res.status(200).json({
      message: "Connexion réussie",
      token,
      user: {
        firstname: user.firstname,
        email: user.email,
        role: user.role,
        id: user.id,
        id_family,  // Ajout de id_family
        id_association,  // Ajout de id_association
        representative: user.association ? user.association.representative : null,
      },
    });
    console.log('Token Payload:', {
      id: user.id,
      email: user.email,
      role: user.role,
      id_family: user.family ? user.family.id : null,
      id_association: user.association ? user.association.id : null
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
