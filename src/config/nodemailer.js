//! Sert de point central pour toute configuration liée à l'envoi d'emails.
//!  Ce fichier ne gère pas directement l'envoi d'emails.

import nodemailer from "nodemailer";
import dotenv from "dotenv";
dotenv.config();

//! Configuration du transporteur nodemailer
const transporter = nodemailer.createTransport({
  host: process.env.SMTP_HOST,
  port: parseInt(process.env.SMTP_PORT, 10),
  secure: false, // Utilise STARTTLS
  auth: {
    user: process.env.EMAIL_USER, // Email utilisé pour l'authentification
    pass: process.env.EMAIL_PASSWORD, // Mot de passe ou clé API pour l'authentification
  },

});


export default transporter;
