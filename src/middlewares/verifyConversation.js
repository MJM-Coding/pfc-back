import  Conversation from "../models/conversation.js";

export const verifyConversationAccess = async (req, res, next) => {
  try {
    const { conversationId } = req.params;
    console.log(`ID de la conversation : ${conversationId}`);

    // Récupérer la conversation par son ID
    const conversation = await Conversation.findByPk(conversationId);
    
    if (!conversation) {
      return res.status(404).json({ error: "Conversation non trouvée." });
    }

    console.log(`Conversation trouvée :`);
    console.log(`ID de la famille dans la conversation : ${conversation.id_family}`);
    console.log(`ID de l'association dans la conversation : ${conversation.id_association}`);
    console.log(`ID de la famille de l'utilisateur connecté : ${req.user.id_family}`);
    console.log(`ID de l'association de l'utilisateur connecté : ${req.user.id_association}`);

    // Vérifier si l'utilisateur connecté est la famille ou l'association de cette conversation
    if (
      (req.user.role === "family" && conversation.id_family !== req.user.id_family) ||
      (req.user.role === "association" && conversation.id_association !== req.user.id_association)
    ) {
      return res.status(403).json({ error: "Accès non autorisé à cette conversation." });
    }

    // L'utilisateur a accès à la conversation, on passe à l'étape suivante
    next();
  } catch (error) {
    console.error("Erreur lors de la vérification de l'accès à la conversation : ", error);
    return res.status(500).json({ error: "Erreur lors de la vérification de l'accès à la conversation." });
  }
};
