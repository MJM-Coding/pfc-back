//! Router secondaire pour les routes liées aux alertes (prefixe de route : /api/ask)

import { Router } from "express";
import withTryCatch from "../controllers/withTryCatchController.js"; // Importation du sélectionrateur de gestion d'erreurs avec try/catch pour middlewares asynchrones
import { askController } from "../controllers/askController.js"; // Importation du Controller askController
import {isRoleAuthorizedMiddleware} from "../middlewares/rightsMiddleware.js"; // Importation du Middleware de vérification des droits
import { verifyToken } from "../auth/verifyToken.js";

export const askRouter = Router();

//* Routes accessibles uniquement aux admin + association
askRouter.get("/", verifyToken,isRoleAuthorizedMiddleware(["admin", "association"]),withTryCatch(askController.getAllAsks)); // Route pour lister toutes les demandes
askRouter.get("/:id", verifyToken,isRoleAuthorizedMiddleware(["admin","association"]), withTryCatch(askController.getAskById)); // Route pour obtenir le détail d'une demande
askRouter.patch("/:id",verifyToken,isRoleAuthorizedMiddleware(["admin", "association", ]),withTryCatch(askController.patchAsk)); // Route pour modifier une demande
  
  
//* Routes accessibles uniquement aux familles d'accueil
askRouter.post("/", verifyToken, isRoleAuthorizedMiddleware(["family"]),withTryCatch(askController.createAsk)); // Route pour créer une nouvelle demande
askRouter.get("/family/:id/asks",verifyToken,isRoleAuthorizedMiddleware(["family"]), withTryCatch(askController.getFamilyAsks));// Route pour récupérer les demandes pour une famille
askRouter.delete("/:id",verifyToken, isRoleAuthorizedMiddleware(["family","association"]),withTryCatch(askController.deleteAsk)); // Route pour supprimer une demande
  