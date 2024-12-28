import { Router } from "express";
import { passwordResetController } from "../controllers/passwordResetController.js";
import withTryCatch from "../controllers/withTryCatchController.js"; // Importation du sélectionrateur de gestion d'erreurs avec try/catch pour middlewares asynchrones

export const passwordResetRouter = Router();

// Route pour demander une réinitialisation du mot de passe
passwordResetRouter.post("/request-reset", withTryCatch(passwordResetController.requestReset));

// Route pour réinitialiser le mot de passe
passwordResetRouter.post("/reset-password", withTryCatch(passwordResetController.resetPassword));


