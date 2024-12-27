//! Router secondaire pour les routes liées aux associations (prefixe de route : /api/association)

import { Router } from "express";
import multer from "multer";
import withTryCatch from "../controllers/withTryCatchController.js"; // Importation du sélectionrateur de gestion d'erreurs avec try/catch pour middlewares asynchrones
import { associationController } from "../controllers/associationController.js";  // Importation du Controller associationController
import { animalController } from "../controllers/animalController.js";
import { askController} from "../controllers/askController.js"
import { verifyToken } from "../auth/verifyToken.js";
import { isRoleAuthorizedMiddleware } from "../middlewares/rightsMiddleware.js";
import { validate } from "../validation/validate.js"; // Importation de la fonction de validation
import { patchSchema } from "../validation/patchAssociation.js"; // Importation du schéma de modification d'utilisateur JOI
import { verifyAssociation } from "../middlewares/verifyUser.js";


export const associationRouter = Router();

// Configuration de multer pour gérer les uploads
const storage = multer.memoryStorage();
const upload = multer({ storage });


//* Routes publiques
associationRouter.get("/", withTryCatch(associationController.getAllAssociations)); 
associationRouter.get("/:id",withTryCatch(associationController.getAssociationById)); 

associationRouter.patch(
    "/:id",
    upload.single("profile_photo"), // Middleware Multer pour gérer une image unique
    verifyToken, isRoleAuthorizedMiddleware(["association"]), verifyAssociation(),
    validate(patchSchema, "body"),
    withTryCatch(associationController.patchAssociation) // Contrôleur pour traiter la mise à jour
  );associationRouter.delete("/:id",verifyToken, isRoleAuthorizedMiddleware(["association"]), verifyAssociation(), withTryCatch(associationController.deleteAssociation));

associationRouter.get("/:id/animal",verifyToken, isRoleAuthorizedMiddleware(["association"]), verifyAssociation(), withTryCatch(animalController.getAllAnimals));
associationRouter.get("/:associationId/animal/:animalId",verifyToken, isRoleAuthorizedMiddleware(["association"]), verifyAssociation(), withTryCatch(animalController.getAnimalById));

associationRouter.get("/:associationId/ask",verifyToken, isRoleAuthorizedMiddleware(["association"]), verifyAssociation(), withTryCatch(askController.getAllAsks));
associationRouter.get("/:associationId/ask/:askId",verifyToken, isRoleAuthorizedMiddleware(["association"]), verifyAssociation(), withTryCatch(askController.getAskById));
associationRouter.patch("/:associationId/ask/:askId",verifyToken, isRoleAuthorizedMiddleware(["association"]), verifyAssociation(), withTryCatch(askController.patchAsk));


// Route pour supprimer la photo de profil
associationRouter.patch("/:id/delete-photo", withTryCatch(associationController.deleteProfilePhoto));
