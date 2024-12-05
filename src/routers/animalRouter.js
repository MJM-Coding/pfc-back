import { Router } from "express";
import multer from "multer";
import withTryCatch from "../controllers/withTryCatchController.js";
import { animalController } from "../controllers/animalController.js";
import { isRoleAuthorizedMiddleware } from "../middlewares/rightsMiddleware.js";
import { verifyToken } from "../auth/verifyToken.js";

export const animalRouter = Router(); // Renommer pour éviter de mélanger avec d'autres routers

// Configuration de multer pour gérer les uploads
const storage = multer.memoryStorage();
const upload = multer({ storage });

//* Routes publiques
animalRouter.get("/", withTryCatch(animalController.getAllAnimals));
animalRouter.get("/:id", withTryCatch(animalController.getAnimalById));

//* Routes accessibles uniquement aux associations
animalRouter.post(
  "/",
  upload.array("image", 4), // Gère l'upload d'images
  verifyToken,
  isRoleAuthorizedMiddleware(["association"]),
  withTryCatch(animalController.createAnimal)
);

animalRouter.patch(
  "/:id",
  upload.fields([{ name: "profile_photo", maxCount: 1 }, { name: "photos", maxCount: 3 }]),
  verifyToken,
  isRoleAuthorizedMiddleware(["association"]),
  withTryCatch(animalController.patchAnimal)
);

animalRouter.delete(
  "/:id",
  verifyToken,
  isRoleAuthorizedMiddleware(["association"]),
  withTryCatch(animalController.deleteAnimal)
);

animalRouter.patch(
  "/:id/delete-photo/:photoType",
  verifyToken, isRoleAuthorizedMiddleware(["association"]), /* verifyAssociation(), */
  withTryCatch(animalController.deleteAnimalPhoto)
);
