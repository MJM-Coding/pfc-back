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
  console.log("Génération d'un token pour la confirmation d'email :", user);

  return jwt.sign(
    { id: user.id, email: user.email, role: user.role }, // Payload : contient les informations utilisateur
    JWT_SECRET, // Clé secrète utilisée pour signer le token
    { expiresIn: "1m" } // Le token pour la confirmation d'email expire dans 24 heures
  );
};

//! Fonction pour générer un token JWT pour une session utilisateur
export const generateTokenForSession = (user) => {
  console.log("Génération d'un token pour une session utilisateur :", user);

  // Ajoutez une vérification pour vous assurer que toutes les informations nécessaires sont présentes
  if (!user.id_family && !user.id_association) {
    console.warn(
      "Attention : L'utilisateur n'a pas de 'id_family' ou 'id_association'. Vérifiez les données utilisateur.",
      user
    );
  }

  return jwt.sign(
    { id: user.id, email: user.email, role: user.role, id_family: user.id_family, id_association: user.id_association }, // Payload : contient les informations utilisateur nécessaires à la session
    JWT_SECRET, // Clé secrète utilisée pour signer le token
    { expiresIn: "1h" } // Le token de session expire après 1 heure
  );
};
