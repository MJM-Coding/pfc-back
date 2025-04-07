import Message from "../models/message.js";
import Conversation from "../models/conversation.js"; // Importer Conversation si nécessaire
import User from "../models/user.js"; 

export const messageController = {
  // Récupérer tous les messages d’une conversation spécifique
  getMessages: async (req, res) => {
    try {
      const { conversationId } = req.params;
      const { id_family, id_association } = req.user;  // Récupérer les données de req.user
  
      console.log(`ID de la famille dans req.user : ${id_family}`);
      console.log(`ID de l'association dans req.user : ${id_association}`);
  
      // Récupérer la conversation par son ID
      const conversation = await Conversation.findByPk(conversationId);
  
      if (!conversation) {
        return res.status(404).json({ error: "Conversation non trouvée." });
      }
  
      console.log(`Conversation trouvée :`);
      console.log(`ID de la famille dans la conversation : ${conversation.id_family}`);
      console.log(`ID de l'association dans la conversation : ${conversation.id_association}`);
  
      // Vérification d'accès en fonction du rôle et de l'association/famille
      if (req.user.role === "family") {
        if (conversation.id_family !== id_family) {
          return res.status(403).json({ error: "Accès non autorisé à cette conversation." });
        }
      } else if (req.user.role === "association") {
        if (conversation.id_association !== id_association) {
          return res.status(403).json({ error: "Accès non autorisé à cette conversation." });
        }
      }
  
      // L'utilisateur a accès à la conversation, on passe à l'étape suivante
      const messages = await Message.findAll({
        where: { id_conversation: conversationId },
        include: [{ model: User, as: "sender", attributes: ["id", "firstname", "lastname"] }],
        order: [["sent_at", "ASC"]],
      });
  
      return res.status(200).json(messages);
    } catch (error) {
      console.error("Erreur lors de la récupération des messages :", error);
      return res.status(500).json({ error: "Erreur lors de la récupération des messages." });
    }
  },
  
  
  
  // Envoyer un message dans une conversation
  sendMessage: async (req, res) => {
    try {
      const { conversationId } = req.params;
      const { content } = req.body;

      // Créer le message
      const newMessage = await Message.create({
        id_conversation: conversationId,
        id_sender: req.user.id, // L'utilisateur connecté envoie le message
        content,
      });

      // Mettre à jour le dernier message de la conversation
      await Conversation.update(
        { last_message_at: new Date() },
        { where: { id: conversationId } }
      );

      return res.status(201).json(newMessage);
    } catch (error) {
      return res.status(500).json({ error: "Erreur lors de l'envoi du message." });
    }
  },

  // Marquer les messages d'une conversation comme lus
  markMessagesAsRead: async (req, res) => {
    try {
      const { conversationId } = req.params;

      // Marquer les messages comme lus
      await Message.update(
        { is_read: true },
        { where: { id_conversation: conversationId, is_read: false } }
      );

      return res.status(200).json({ message: "Messages marqués comme lus." });
    } catch (error) {
      return res.status(500).json({ error: "Erreur lors de la mise à jour du statut des messages." });
    }
  }
};
