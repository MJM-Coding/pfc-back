//! Router secondaire pour les routes liées aux familles d'accueil (prefixe de route : /api/family)

import { Router } from "express";
import multer from "multer";
import withTryCatch from "../controllers/withTryCatchController.js"; // Importation du sélectionrateur de gestion d'erreurs avec try/catch pour middlewares asynchrones
import { familyController } from "../controllers/familyController.js"; // Importation du Controller familyController
import { animalController } from "../controllers/animalController.js";
import { isRoleAuthorizedMiddleware } from "../middlewares/rightsMiddleware.js"; // Importation du Middleware de vérification des droits
import { validate } from "../validation/validate.js"; // Importation de la fonction de validation
import { patchSchema } from "../validation/patchFamily.js"; // Importation du schéma de modification d'utilisateur JOI
import { verifyFamily } from "../middlewares/verifyUser.js";

export const familyRouter = Router();

// Configuration de multer pour gérer les uploads
const storage = multer.memoryStorage();
const upload = multer({ storage });

//* Routes accessibles uniquement aux admin et aux associations
familyRouter.get("/",/*  isRoleAuthorizedMiddleware(["admin","association"]), */ withTryCatch(familyController.getAllFamilies)); // Route pour lister toutes les familles
familyRouter.get("/:id", /* isRoleAuthorizedMiddleware(["admin", "association", "family"]), verifyFamily(), */ withTryCatch(familyController.getFamilyById)); // Route pour obtenir le détail d'une famille

familyRouter.patch(
    "/:id",
    upload.single("profile_photo"), // Gère l'upload d'une seule image
    validate(patchSchema, "body"),
    withTryCatch(familyController.patchFamily)
  );
  
// Route pour supprimer la photo de profil
familyRouter.patch("/:id/delete-photo", withTryCatch(familyController.deleteProfilePhoto));

familyRouter.delete("/:id",/*  isRoleAuthorizedMiddleware(["family"]), verifyFamily(),  */withTryCatch(familyController.deleteFamily));

familyRouter.get("/:id/animal", /* isRoleAuthorizedMiddleware(["family"]), verifyFamily(), */ withTryCatch(animalController.getAllAnimals))