import { Router } from "express";
import withTryCatch from "../controllers/withTryCatchController.js"; // Middleware pour la gestion des erreurs
import { conversationController } from "../controllers/conversationController.js"; // Import du contrôleur de conversation
import { verifyToken } from "../auth/verifyToken.js"; // Middleware d'authentification
import { isRoleAuthorizedMiddleware } from "../middlewares/rightsMiddleware.js"; // Middleware de vérification des rôles
import { validate } from "../validation/validate.js"; // Middleware de validation
import { messageSchema } from "../validation/messageValidation.js"; // Schéma JOI pour les messages
import { verifyConversationAccess } from "../middlewares/verifyConversation.js"; // Middleware de vérification d'accès à une conversation

export const conversationRouter = Router();

//! Créer une conversation (si elle n'existe pas déjà)
conversationRouter.post(
    "/",
     
    isRoleAuthorizedMiddleware(["family", "association"]),
    withTryCatch(conversationController.createConversation)
);

//! Récupérer toutes les conversations d’un utilisateur connecté
conversationRouter.get(
    "/",
    
    isRoleAuthorizedMiddleware(["family", "association"]),
    withTryCatch(conversationController.getUserConversations)
);

//! Récupérer tous les messages d’une conversation spécifique
conversationRouter.get(
    "/:conversationId/messages",
    
    isRoleAuthorizedMiddleware(["family", "association"]),
    verifyConversationAccess, // Vérifie que l'utilisateur fait bien partie de la conversation
    withTryCatch(conversationController.getMessages)
);

//! Envoyer un message dans une conversation
conversationRouter.post(
    "/:conversationId/messages",
    
    isRoleAuthorizedMiddleware(["family", "association"]),
    verifyConversationAccess,
    validate(messageSchema, "body"), // Validation du message avec JOI
    withTryCatch(conversationController.sendMessage)
);

//! Marquer les messages comme lus
conversationRouter.patch(
    "/:conversationId/messages/read",
    
    isRoleAuthorizedMiddleware(["family", "association"]),
    verifyConversationAccess,
    withTryCatch(conversationController.markMessagesAsRead)
);

//! Supprimer une conversation
conversationRouter.delete(
    "/:conversationId",
    isRoleAuthorizedMiddleware(["family", "association"]),
    verifyConversationAccess, // Vérifie que l'utilisateur fait bien partie de la conversation
    withTryCatch(conversationController.deleteConversation)
  );
  