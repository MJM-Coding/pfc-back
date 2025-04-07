import { Router } from "express";
import { messageController } from "../controllers/messageController.js"; // Importer le contrôleur des messages
import { isRoleAuthorizedMiddleware } from "../middlewares/rightsMiddleware.js"; // Middleware de vérification des rôles
import { verifyConversationAccess } from "../middlewares/verifyConversation.js"; // Middleware de vérification d'accès à une conversation
import { validate } from "../validation/validate.js"; // Middleware de validation si nécessaire
import { messageSchema } from "../validation/messageValidation.js"; // Schéma de validation pour les messages si nécessaire

export const messageRouter = Router();

//! Récupérer tous les messages d’une conversation spécifique
messageRouter.get(
  "/:conversationId/messages",
  isRoleAuthorizedMiddleware(["family", "association"]),
  verifyConversationAccess, // Vérifie l'accès à la conversation
  messageController.getMessages
);

//! Envoyer un message dans une conversation
messageRouter.post(
  "/:conversationId/messages",
  isRoleAuthorizedMiddleware(["family", "association"]),
  verifyConversationAccess, // Vérifie l'accès à la conversation
  validate(messageSchema, "body"), // Validation des données du message
  messageController.sendMessage
);

//! Marquer les messages comme lus
messageRouter.patch(
  "/:conversationId/messages/read",
  isRoleAuthorizedMiddleware(["family", "association"]),
  verifyConversationAccess, // Vérifie l'accès à la conversation
  messageController.markMessagesAsRead
);
