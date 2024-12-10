//! Router secondaire pour les routes liées aux alertes (prefixe de route : /api/ask)

import { Router } from "express";
import withTryCatch from "../controllers/withTryCatchController.js"; // Importation du sélectionrateur de gestion d'erreurs avec try/catch pour middlewares asynchrones
import { askController } from "../controllers/askController.js"; // Importation du Controller askController
import {isRoleAuthorizedMiddleware} from "../middlewares/rightsMiddleware.js"; // Importation du Middleware de vérification des droits
import { verifyToken } from "../auth/verifyToken.js";

export const askRouter = Router();

//* Routes accessibles uniquement aux admin
askRouter.get("/", isRoleAuthorizedMiddleware(["admin"]),withTryCatch(askController.getAllAsks)); // Route pour lister toutes les demandes
askRouter.get("/:id", isRoleAuthorizedMiddleware(["admin"]), withTryCatch(askController.getAskById)); // Route pour obtenir le détail d'une demande

askRouter.patch(
    "/:id",
    verifyToken, // Ajout du middleware pour vérifier le token
    isRoleAuthorizedMiddleware(["admin", "association", ]), // Vérification du rôle
    withTryCatch(askController.patchAsk) // Contrôleur pour gérer la modification de la demande
  );
  
//* Routes accessibles uniquement aux familles d'accueil
askRouter.post("/", verifyToken, isRoleAuthorizedMiddleware(["family"]),withTryCatch(askController.createAsk)); // Route pour créer une nouvelle demande

// Route pour récupérer les demandes pour une famille
askRouter.get(
    "/family/:id/asks",
    verifyToken, // Vérifie le token de l'utilisateur
    isRoleAuthorizedMiddleware(["family"]), // Vérifie que l'utilisateur a le rôle "family"
    withTryCatch(askController.getFamilyAsks), // Utilise le middleware withTryCatch pour gérer les erreursgetFamilyAsks // Appelle le contrôleur
  );


  askRouter.delete(
    "/:id",
    verifyToken, // Middleware pour vérifier le token
    isRoleAuthorizedMiddleware(["family"]), // Vérifie que l'utilisateur a le rôle "family"
    withTryCatch(askController.deleteAsk) // Utilise le middleware withTryCatch pour gérer les erreurs
  );
  