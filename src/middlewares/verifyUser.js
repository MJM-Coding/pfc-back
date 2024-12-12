import { Association, Family, User } from "../models/index.js";

export function verifyFamily() {
    return async function (req, res, next) {
      const familyId = req.params.id || req.params.familyId;
  
  
      if (!familyId) {
        return res.status(400).json({ error: "ID de famille manquant dans la requête" });
      }
  
      try {
        const family = await Family.findOne({
          where: { id: familyId },
          include: [{ model: User }],
        });
   
        if (!family) {
          return res.status(404).json({ error: "Profil famille non trouvé" });
        }
  
        if (family.User.id !== req.user.id) {
          console.error("verifyFamily - Accès interdit : ID utilisateur ne correspond pas");
          return res.status(403).json({ error: "Accès interdit : Vous n'êtes pas habilité" });
        }
  
        next();
      } catch (error) {
        console.error("Erreur dans verifyFamily :", error);
        res.status(500).json({ error: "Erreur interne du serveur" });
      }
    };
  }
  

export function verifyAssociation() {
  return async function (req, res, next) {
    const associationId = req.params.id || req.params.associationId;

    if (!associationId) {
      return res.status(400).json({ error: "ID d'association manquant dans la requête" });
    }

    try {
      const association = await Association.findOne({
        where: { id: associationId },
        include: [{ model: User }],
      });

      if (!association) {
        return res.status(404).json({ error: "Profil association non trouvé" });
      }

      if (association.User.id !== req.user.id) {
        return res.status(403).json({ error: "Accès interdit : Vous n'êtes pas habilité" });
      }

      next();
    } catch (error) {
      console.error("Erreur dans verifyAssociation :", error);
      res.status(500).json({ error: "Erreur interne du serveur" });
    }
  };
}

export function verifyUser() {
  return async function (req, res, next) {
    const userId = req.params.id || req.params.userId;

    if (!userId) {
      return res.status(400).json({ error: "ID utilisateur manquant dans la requête" });
    }

    try {
      const user = await User.findByPk(userId);

      if (!user) {
        return res.status(404).json({ error: "Profil utilisateur non trouvé" });
      }

      if (user.id !== req.user.id) {
        return res.status(403).json({ error: "Accès interdit : Vous n'êtes pas habilité" });
      }

      next();
    } catch (error) {
      console.error("Erreur dans verifyUser :", error);
      res.status(500).json({ error: "Erreur interne du serveur" });
    }
  };
}
