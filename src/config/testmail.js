import transporter from "./nodemailer.js";
import dotenv from "dotenv";
dotenv.config();

async function sendTestEmail() {
  try {
    const info = await transporter.sendMail({
      from: process.env.EMAIL_USER, // Votre email
      to: "j.mos@live.fr", // L'adresse destinataire
      subject: "Test d’envoi d’email",
      text: "Ceci est un test d'envoi d'email via Gmail.", // Contenu
    });

    console.log("Email envoyé avec succès :", info.messageId);
  } catch (error) {
    console.error("Erreur lors de l’envoi de l’email :", error);
  }
}

sendTestEmail();
