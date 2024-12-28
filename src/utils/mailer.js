//! Utilitaire pour l'envoi d'emails avec nodemailer
import transporter from "../config/nodemailer.js";


//! Fonction pour envoyer un email
export const sendEmail = async (to, subject, text) => {
  const mailOptions = {
    from: process.env.EMAIL_USER, // Adresse de l'expéditeur (définie dans les variables d'environnement)
    to, // Destinataire de l'email
    subject, // Sujet de l'email
    text, // Contenu texte de l'email
  };

  await transporter.sendMail(mailOptions);
};
