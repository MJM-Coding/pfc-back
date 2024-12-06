//! Router principal
import { Router } from "express";

import { errorHandler } from '../middlewares/errorhandle.js'; // Importation du gestionnaire d'erreurs global
import  HttpError  from "../middlewares/httperror.js"; // Importation de la classe d'erreur HTTP personnalisée
import withTryCatch from "../controllers/withTryCatchController.js"; // Importation du décorateur de gestion d'erreurs avec try/catch pour middlewares asynchrones
import { verifyToken } from "../auth/verifyToken.js"; // Importation du Middleware de vérification du token

import { animalRouter } from "./animalRouter.js"; // router secondaire pour les routes liées aux animaux
import { askRouter } from "./askRouter.js"; // router secondaire pour les routes liées aux alertes
import { associationRouter } from "./associationRouter.js"; // router secondaire pour les routes liées aux associations
import { familyRouter } from "./familyRouter.js"; // router secondaire pour les routes liées aux familles d'accueil
import { userRouter } from "./userRouter.js"; // router secondaire pour les routes liées aux utilisateurs
import { createUserController } from "../controllers/createUserController.js";

import { validate } from "../validation/validate.js"; // Importation de la fonction de validation
import { createSchema } from "../validation/allUser.js"; // Importation du schéma d'inscription JOI


import { signinController } from "../controllers/signinController.js"; // Importation du Controller signinController pour la connexion


const mainRouter = Router();


//! Routeurs secondaires
mainRouter.use("/association", associationRouter); // toutes les routes commencant par /association seront traitées par associationRouter
mainRouter.use("/animal", animalRouter); // toutes les routes commencant par /animal seront traitées par animalRouter
mainRouter.use("/ask", /*  verifyToken,  */ askRouter); // toutes les routes commencant par /ask seront traitées par askRouter
mainRouter.use("/family", /* verifyToken,  */familyRouter); // toutes les routes commencant par /family seront traitées par familyRouter
mainRouter.use("/user", userRouter);// toutes les routes commencant par /user seront traitées par userRouter

//! Routes pour la connexion 
mainRouter.post("/signin", withTryCatch(signinController.signinUser)); // Connexion

//! Route de raffraichissement du token
mainRouter.post("/refresh-token", withTryCatch(signinController.refreshToken));

//! Route pour confirmer l'email
mainRouter.get("/confirm-email/:token", createUserController.confirmEmail);

// *Middleware pour gérer les routes non trouvées
mainRouter.use((req, res, next)=>{
  next(new HttpError(404, "Resource not found")); 
});

// *Middleware de gestion globale des erreursS
mainRouter.use(errorHandler); 


export default mainRouter; 