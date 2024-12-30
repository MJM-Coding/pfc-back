//! Utilitaire pour l'envoi d'emails avec nodemailer
import transporter from "../config/nodemailer.js";


//! Fonction pour envoyer un email
export const sendEmail = async (to, subject, htmlContent) => {
  const mailOptions = {
    from: process.env.EMAIL_USER, // Adresse de l'expéditeur
    to, // Destinataire
    subject, // Sujet
    html: htmlContent, // Contenu HTML
  };

  await transporter.sendMail(mailOptions);
};
