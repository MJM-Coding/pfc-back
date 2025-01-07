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
      `
      <div style="font-family: Arial, sans-serif; line-height: 1.5; color: #333;">
        <h2 style="color: #007BFF;">Réinitialisation de votre mot de passe</h2>
        <p>Bonjour,</p>
        <p>Vous avez demandé à réinitialiser votre mot de passe. Cliquez sur le bouton ci-dessous :</p>
        <a href="${resetLink}" 
           style="display: inline-block; padding: 10px 20px; font-size: 16px; color: #fff; background-color: #007BFF; text-decoration: none; border-radius: 5px;">
           Réinitialiser mon mot de passe
        </a>
        <p style="margin-top: 20px;">Si vous n'avez pas fait cette demande, ignorez cet e-mail.</p>
        <p>Merci,</p>
        <p>L'équipe de support</p>
      </div>
      `
    );
    

    res.status(200).json({ message: "Un email de réinitialisation a été envoyé." });
  },

  //! Réinitialisation du mot de passe
  async resetPassword(req, res) {
    const { token, newPassword } = req.body;

    // Décoder le token
    const decoded = jwt.verify(token, JWT_SECRET);

    // Hacher le nouveau mot de passe
    const hashedPassword = Scrypt.hash(newPassword);

    // Mettre à jour le mot de passe dans la base
    await updateUserPassword(decoded.id, hashedPassword);

    res.status(200).json({ message: "Mot de passe réinitialisé avec succès." });
  },
};
