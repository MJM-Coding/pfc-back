import jwt from "jsonwebtoken"; // Importation de la bibliothèque jsonwebtoken pour gérer les tokens JWT

// Récupération de la clé secrète à partir des variables d'environnement pour signer et vérifier les tokens JWT
const JWT_SECRET = process.env.JWT_SECRET;

//! Middleware de vérification du token JWT
export const verifyToken = (req, res, next) => {
  // Récupérer le token de l'en-tête Authorization
  const authHeader = req.headers["authorization"];
  const sessionToken = req.headers["sessiontoken"];
  const token = authHeader && authHeader.split(" ")[1];

  // Si aucun token n'est présent dans l'en-tête, renvoie une erreur 401 "Unauthorized"
  if (!token) {
    return res.status(401).json({ message: "Token introuvable" });
  }

  //! Vérifie et décode le token
  jwt.verify(token, JWT_SECRET, (err, user) => {
    // Gestion des erreurs lors de la vérification du token
    if (err) {
      console.error("Erreur lors de la vérification du token :", err.message);
      
      // Si le token est expiré, renvoyer un statut 401 avec un message explicite
      if (err.name === "TokenExpiredError") {
        return res.status(401).json({ message: "Token expiré" });
      }

      // Pour toute autre erreur de vérification, renvoyer un statut 403 "Forbidden"
      return res.status(403).json({ message: "Token invalide" });
    }

    // Si le token est valide, ajoute les informations de l'utilisateur décodées à `req.user`
    req.user = {
      id: user.id,
      email: user.email,
      role: user.role,
      id_family: user.id_family,
      id_association: user.id_association,
    };

    console.log("Utilisateur ajouté à req.user :", req.user);
    next();
  });
};
