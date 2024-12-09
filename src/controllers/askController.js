import Ask from "../models/ask.js";
import HttpError from "../middlewares/httperror.js";
import Animal from "../models/animal.js";
import Family from "../models/family.js";
import { Association } from "../models/index.js";

export const askController = {
  //! Méthode pour lister toutes les demandes (de l'association)
  getAllAsks: async (req, res) => {
    const association = await Association.findOne({where: {id_user: req.user.id}});
    const asks = await Ask.findAll({
      include: [
        { 
          model: Family, as: "family",
          include: {association :"user", attributes: {exclude: ["password"]}},
         }, // Inclut la famille associée à la demande
        { model: Animal, as: "animal", where : {id_association: association.id}}, // Inclut l'animal associé à la demande
      ],
    },
   );
    res.status(200).json(asks); 
  },

  //! Méthode pour lister une seule demande
  getAskById: async (req, res) => {
    const id = req.params.askId;
    const ask = await Ask.findByPk( id, {
      include: [
        { model: Family, as: "family",
          include: {association :"user", attributes: {exclude: ["password"]}}
        }, // Inclut la famille associée à la demande
        { model: Animal, as: "animal"}, // Inclut l'animal associé à la demande
      ],
    });

    if (!ask) {
      return res.status(404).json({error: "ask not found"})
    }

    res.status(200).json(ask); 
  },

  //! Méthode pour ajouter une demande
  createAsk: async (req, res) => {
    const family = await Family.findOne({
      where: { id_user: req.user.id }
    })
    const ask = req.body;
    ask.id_family = family.id;

     // Vérifier si une demande similaire existe déjà
    const existingAsk = await Ask.findOne({
      where: {
        id_family: ask.id_family,
        id_animal: ask.id_animal,
        status: "en attente",
      },
    });

    if (existingAsk) {
      return res.status(409).json({ message: "Une demande pour cet animal est déjà en cours. Merci d'attendre la validation par l'association." });
    }

    const newAsk = await Ask.create(ask); 
    res.status(201).json(newAsk); 
  },

  //! Méthode pour modifier une demande
  patchAsk: async (req, res) => {
    const id = req.params.id;
    const newStatut = req.body; 
    const ask = await Ask.findByPk(id);
  
    if (!ask) {
      return res.status(404).json({ error: "Request not found." });
    }
   

    console.log('User ID Family:', req.user.id_family);
    console.log('Ask ID Family:', ask.id_family);
    // Vérification de l'autorisation
  if (req.user.role !== 'admin' && req.user.id_family !== ask.id_family) {
  return res.status(403).json({ error: "Vous n'êtes pas autorisé à modifier cette demande." });
}

  
    // Mise à jour du statut si une valeur spécifique est fournie (par exemple "cancelled")
    if (newStatut.status === "cancelled") {
      await ask.update({ status: "cancelled" });
    } else {
      return res.status(400).json({ error: "Statut invalide pour l'annulation." });
    }
    
    return res.status(200).json(ask);
  },
  
  

  //! Méthode pour lister toutes les demandes d'une famille
   
  getFamilyAsks: async (req, res) => {
    try {
      // Identifie l'utilisateur actuel
      const userId = req.user.id;
  
      // Vérifie si l'utilisateur est lié à une famille
      const family = await Family.findOne({
        where: { id_user: userId },
      });
  
      if (!family) {
        return res
          .status(403)
          .json({ error: "Accès interdit : Vous n'êtes pas autorisé à consulter ces demandes." });
      }
  
      const familyId = family.id;
  
      // Récupère les demandes d'accueil pour cette famille
      const asks = await Ask.findAll({
        where: { id_family: familyId },
        include: [
          {
            model: Animal,
            as: "animal",
            attributes: ["id", "name", "species", "breed", "profile_photo"],
          },
        ],
      });
  
      if (!asks || asks.length === 0) {
        return res.status(200).json([]); // Renvoie un tableau vide avec un statut 200
      }
  
      res.status(200).json(asks);
    } catch (error) {
      console.error("Erreur dans getFamilyAsks :", error);
      res.status(500).json({ error: "Erreur interne du serveur." });
    }
  }
};  
