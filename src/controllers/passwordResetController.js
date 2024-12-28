import jwt from "jsonwebtoken";
import { Scrypt } from "../auth/Scrypt.js"; // Importation de la classe Scrypt
import { findUserByEmail, updateUserPassword } from "../models/userService.js"; // Vos fonctions pour la BDD
import { sendEmail } from "../utils/mailer.js";

const JWT_SECRET = process.env.JWT_SECRET;

//! Gére la demande de réinitialisation
export const passwordResetController = {
  async requestReset(req, res) {
    const { email } = req.body;

    // Vérifiez si l'utilisateur existe
    const user = await findUserByEmail(email);
    if (!user) {
      return res.status(404).json({ message: "Utilisateur non trouvé." });
    }

    // Générer un token JWT
    const token = jwt.sign({ id: user.id }, JWT_SECRET, { expiresIn: "1h" });

    // Construire le lien de réinitialisation
    const resetLink = `${process.env.FRONTEND_URL}/reset-password?token=${token}`;

    // Envoyer l'email avec le lien
    await sendEmail(
      user.email,
      "Réinitialisation de votre mot de passe",
      `Cliquez sur ce lien pour réinitialiser votre mot de passe : ${resetLink}`
    );

    res.status(200).json({ message: "Un email de réinitialisation a été envoyé." });
  },

  //! Réinitialisation du mot de passe
  async resetPassword(req, res) {
    const { token, newPassword } = req.body;

    console.log("Token reçu :", token);
    console.log("Nouveau mot de passe :", newPassword);

    // Décoder le token
    const decoded = jwt.verify(token, JWT_SECRET);

    // Hacher le nouveau mot de passe
    const hashedPassword = Scrypt.hash(newPassword);

    // Mettre à jour le mot de passe dans la base
    await updateUserPassword(decoded.id, hashedPassword);

    res.status(200).json({ message: "Mot de passe réinitialisé avec succès." });
  },
};
