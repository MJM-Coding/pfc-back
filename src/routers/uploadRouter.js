import { Router } from "express";
import multer from "multer";
import { uploadImage } from "../controllers/imageController.js"; // Importation du contrôleur
import withTryCatch from "../controllers/withTryCatchController.js"; // Gestion des erreurs avec try-catch

// Créez un stockage en mémoire pour multer
const storage = multer.memoryStorage();
const upload = multer({ storage });

const router = Router();

// Route pour l'upload d'une image de famille (POST)
router.post("/family/:id", upload.single("image"), withTryCatch(uploadImage));

// Route pour l'upload d'une image d'association (POST)
router.post("/association/:id", upload.single("image"), withTryCatch(uploadImage));

// Route pour l'upload d'une image d'animal (POST) avec photoType
router.post("/animal/:id/:photoType", upload.single("image"), withTryCatch(uploadImage));

export default router;
