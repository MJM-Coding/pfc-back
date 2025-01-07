import { randomBytes, scryptSync } from "crypto"; // Importation des modules pour le hachage
import User from "../../models/user.js"; // Importation du modèle User


//! Fonction pour hacher le mot de passe
const hashPassword = (password) => {
    const salt = randomBytes(16).toString("hex");
    const buffer = scryptSync(password, salt, 64, {
        N: 131072,
        maxmem: 134220800,
    }).toString("hex");
    return `${buffer}.${salt}`;
};

//! Fonction pour hacher tous les mots de passe des utilisateurs
const hashAllPasswords = async () => {
  try {
    // Récupération de tous les utilisateurs
    const users = await User.findAll();

    // Parcours des utilisateurs pour hacher les mots de passe
    for (const user of users) {

      // Hachage du mot de passe
      const hashedPassword = hashPassword(user.password);

      // Mise à jour de l'utilisateur avec le mot de passe haché
      await user.update({ password: hashedPassword });
    }

  } catch (error) {
    console.error("Erreur lors du hachage des mots de passe :", error);
  }
};

// Appel de la fonction pour hacher tous les mots de passe
hashAllPasswords();