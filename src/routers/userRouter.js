//! Router secondaire pour les routes liées aux utilisateurs (prefixe de route : /api/user)

import { Router } from "express";

import { userController } from "../controllers/userController.js";  // Importation du Controller userController
import { createUserController } from "../controllers/createUserController.js"; // Importation du Controller createUserController

import withTryCatch from "../controllers/withTryCatchController.js"; // Importation du sélectionrateur de gestion d'erreurs avec try/catch pour middlewares asynchrones
import { validate } from "../validation/validate.js"; // Importation de la fonction de validation
import {  createSchema, patchSchema } from "../validation/allUser.js"; // Importation du schéma de modification d'utilisateur JOI
import {  isRoleAuthorizedMiddleware} from "../middlewares/rightsMiddleware.js"; // Importation du Middleware de vérification des droits
import { verifyUser } from "../middlewares/verifyUser.js";

import { verifyToken } from "../auth/verifyToken.js";

export const userRouter = Router();

//* Routes publiques
userRouter.get("/", withTryCatch(userController.getAllUsers)); // Route pour lister tous les utilisateurs RESTCLient
userRouter.get("/:id", withTryCatch(userController.getOneUser));

userRouter.post ("/", validate (createSchema, "body"), withTryCatch(createUserController.createUser)); // Route pour ajouter un nouvel utilisateur

//* Routes accessibles uniquement aux admin
userRouter.patch("/:id", verifyToken, isRoleAuthorizedMiddleware(["admin"]), verifyUser(), validate(patchSchema, "body"),withTryCatch(userController.patchUser)); // Route pour modifier un utilisateur par son ID

//* Routes accessibles uniquement aux admin
userRouter.delete("/:id", verifyToken, isRoleAuthorizedMiddleware(["admin"]), verifyUser(), withTryCatch(userController.deleteUser)); // Route pour supprimer un utilisateur par son ID