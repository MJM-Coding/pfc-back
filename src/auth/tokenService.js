import jwt from "jsonwebtoken"; // Importation de la bibliothèque jsonwebtoken pour gérer les JSON Web Tokens (JWT)

//! Récupération de la clé secrète pour signer les tokens depuis les variables d'environnement
const JWT_SECRET = process.env.JWT_SECRET;

// Vérifiez que la clé secrète est bien définie
if (!JWT_SECRET) {
  console.error("JWT_SECRET n'est pas défini dans les variables d'environnement.");
  throw new Error("JWT_SECRET doit être configuré.");
}

//! Fonction pour générer un token JWT pour la confirmation d'email
export const generateConfirmationToken = (user) => {

  return jwt.sign(
    { id: user.id, email: user.email, role: user.role }, // Payload : contient les informations utilisateur
    JWT_SECRET, // Clé secrète utilisée pour signer le token
    { expiresIn: "24h" } // Le token pour la confirmation d'email expire dans 24 heures
  );
};

//! Fonction pour générer un token JWT pour une session utilisateur
export const generateTokenForSession = (user) => {
  return jwt.sign(
    {
      id: user.id,
      email: user.email,
      role: user.role,
      id_family: user.id_family || null,
      id_association: user.id_association || null,
    },
    JWT_SECRET, // Clé secrète utilisée pour signer le token
    { expiresIn: "1h" } // Durée de validité du token
  );
};

