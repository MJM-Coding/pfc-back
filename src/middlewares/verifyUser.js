import { Association, Family, User } from "../models/index.js";

//! Middleware de vérification de la famille
export function verifyFamily() {
  return async function (req, res, next) {
    const familyId = req.params.id || req.params.familyId;

    console.log("verifyFamily - ID Famille reçu :", familyId);

    if (!familyId) {
      return res.status(400).json({ error: "ID de famille manquant dans la requête" });
    }

    try {
      const family = await Family.findOne({
        where: { id: familyId },
        include: [{ model: User, as: "user" }], 
      });

      if (!family) {
        console.error("verifyFamily - Famille non trouvée");
        return res.status(404).json({ error: "Profil famille non trouvé" });
      }

      console.log("verifyFamily - Famille trouvée :", family);

      if (!family.user || family.user.id !== req.user.id) {
        console.error("verifyFamily - ID utilisateur ne correspond pas ou utilisateur manquant");
        return res.status(403).json({ error: "Accès interdit : Vous n'êtes pas habilité" });
      }

      console.log("verifyFamily - ID utilisateur lié à la famille :", family.user.id);

      next();
    } catch (error) {
      console.error("Erreur dans verifyFamily :", error);
      res.status(500).json({ error: "Erreur interne du serveur" });
    }
  };
}

//! Middleware de vérification de l'association
export function verifyAssociation() {
  return async function (req, res, next) {
    const associationId = req.params.id || req.params.associationId;

    console.log("[verifyAssociation] ID d'association reçu :", associationId);

    if (!associationId) {
      console.error("[verifyAssociation] ID d'association manquant");
      return res.status(400).json({ error: "ID d'association manquant dans la requête" });
    }

    try {
      // Recherche de l'association avec l'utilisateur associé
      const association = await Association.findOne({
        where: { id: associationId },
        include: [{ model: User, as: "user" }],
      });

      // Vérification si l'association existe
      if (!association) {
        console.error("[verifyAssociation] Association non trouvée pour l'ID :", associationId);
        return res.status(404).json({ error: "Profil association non trouvé" });
      }

      console.log("[verifyAssociation] Association trouvée :", association);
      console.log("[verifyAssociation] Utilisateur associé :", association.user);

      // Vérification si l'utilisateur associé correspond à celui dans req.user
      if (!association.user || association.user.id !== req.user.id) {
        console.error(
          "[verifyAssociation] Accès interdit : L'utilisateur associé ne correspond pas ou est manquant.",
          { utilisateurDansRequete: req.user.id, utilisateurAssocie: association.user?.id }
        );
        return res.status(403).json({ error: "Accès interdit : Vous n'êtes pas habilité" });
      }

      // Log succès avant de passer au middleware suivant
      console.log("[verifyAssociation] Vérification réussie pour l'utilisateur :", req.user.id);

      next();
    } catch (error) {
      console.error("[verifyAssociation] Erreur lors de la vérification :", error);
      res.status(500).json({ error: "Erreur interne du serveur" });
    }
  };
}

//! Middleware de vérification de l'utilisateur
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
