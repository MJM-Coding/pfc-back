import  Conversation  from "../models/conversation.js";
import  Message from "../models/message.js";
import User from "../models/user.js";
import Family from "../models/family.js";
import Association from "../models/association.js";

export const conversationController = {

// ! Créer une conversation entre une famille et une association (si elle n'existe pas déjà)
createConversation: async (req, res) => {
    try {
      const { id_family, id_association } = req.body;
  
      // Vérifie si la conversation existe déjà
      const existingConversation = await Conversation.findOne({
        where: { id_family, id_association },
      });
  
      if (existingConversation) {
        return res.status(200).json(existingConversation);  // Si la conversation existe déjà, on la renvoie
      }
  
      // Création de la nouvelle conversation
      const newConversation = await Conversation.create({ id_family, id_association });
  
      return res.status(201).json(newConversation);  // Nouvelle conversation créée
    } catch (error) {
      console.error("Erreur lors de la création de la conversation :", error);
      res.status(500).json({ error: "Erreur lors de la création de la conversation." });
    }
  },
  


//! Récupérer toutes les conversations d'un utilisateur connecté
getUserConversations: async (req, res) => {
    try {
      // Identifie l'utilisateur actuel
      const userId = req.user.id;
  
      // Vérifie si l'utilisateur est une famille
      const family = await Family.findOne({ where: { id_user: userId } });
      const association = await Association.findOne({ where: { id_user: userId } });
  
      // Vérifie si l'utilisateur est bien une famille ou une association
      if (!family && !association) {
        return res.status(403).json({ error: "Accès interdit : Vous n'êtes pas autorisé à consulter ces conversations." });
      }
  
      let conversations;
      if (family) {
        // Récupère les conversations où cette famille est impliquée
        conversations = await Conversation.findAll({
          where: { id_family: family.id },
          include: [
            { model: Association, as: "association", attributes: ["id", "representative", "profile_photo"] },
          ],
          order: [["last_message_at", "DESC"]],
        });
      } else if (association) {
        // Récupère les conversations où cette association est impliquée
        conversations = await Conversation.findAll({
          where: { id_association: association.id },
          include: [
            { model: Family, as: "family", attributes: ["id", "profile_photo"] },
          ],
          order: [["last_message_at", "DESC"]],
        });
      }
  
      if (!conversations || conversations.length === 0) {
        return res.status(200).json([]); // Retourne un tableau vide si aucune conversation n'est trouvée
      }
  
      res.status(200).json(conversations);
    } catch (error) {
      console.error("Erreur dans getUserConversations :", error);
      res.status(500).json({ error: "Erreur interne du serveur." });
    }
  },
  


 //! Récupérer tous les messages d’une conversation spécifique
getMessages : async (req, res) => {
  try {
    const { conversationId } = req.params;

    const messages = await Message.findAll({
      where: { id_conversation: conversationId },
      include: [{ model: User, as: "sender", attributes: ["id", "firstname", "lastname"] }],
      order: [["sent_at", "ASC"]],
    });

    return res.status(200).json(messages);
  } catch (error) {
    return res.status(500).json({ error: "Erreur lors de la récupération des messages." });
  }
},


 //! Envoyer un message dans une conversation
sendMessage: async (req, res) => {
  try {
    const { conversationId } = req.params;
    const { content } = req.body;

    // Création du message
    const newMessage = await Message.create({
      id_conversation: conversationId,
      id_sender: req.user.id,
      content,
    });

    return res.status(201).json(newMessage);
  } catch (error) {
    return res.status(500).json({ error: "Erreur lors de l'envoi du message." });
  }
},


 //! Marquer les messages d'une conversation comme lus
markMessagesAsRead : async (req, res) => {
  try {
    const { conversationId } = req.params;

    await Message.update(
      { is_read: true },
      { where: { id_conversation: conversationId, is_read: false } }
    );

    return res.status(200).json({ message: "Messages marqués comme lus." });
  } catch (error) {
    return res.status(500).json({ error: "Erreur lors de la mise à jour du statut des messages." });
  }
},

//! Supprimer une conversation
deleteConversation: async (req, res) => {
  try {
    const { conversationId } = req.params;

    // Vérifie si la conversation existe
    const conversation = await Conversation.findByPk(conversationId);

    if (!conversation) {
      return res.status(404).json({ error: "Conversation non trouvée." });
    }

    // Vérifie si l'utilisateur est autorisé à supprimer la conversation (soit famille, soit association)
    if (
      conversation.id_family !== req.user.id_family &&
      conversation.id_association !== req.user.id_association
    ) {
      return res.status(403).json({ error: "Accès interdit : Vous n'êtes pas autorisé à supprimer cette conversation." });
    }

    // Supprime la conversation et ses messages associés
    await Message.destroy({ where: { id_conversation: conversationId } }); // Supprime tous les messages de la conversation
    await conversation.destroy(); // Supprime la conversation elle-même

    return res.status(200).json({ message: "Conversation supprimée avec succès." });
  } catch (error) {
    console.error("Erreur lors de la suppression de la conversation :", error);
    return res.status(500).json({ error: "Erreur interne du serveur." });
  }
},

};