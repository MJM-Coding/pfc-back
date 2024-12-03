import cloudinary from "../config/cloudinaryConfig.js";
import family from "../models/family.js";
import animal from "../models/animal.js";
import association from "../models/association.js";
import HttpError from "../middlewares/httperror.js";


export const uploadImage = async (req, res, next) => {
  try {
    // Vérification de la présence du fichier
    console.log("Début de la fonction uploadImage");
    if (!req.file) {
      console.error("Aucun fichier téléchargé");
      return next(new HttpError(400, "Aucun fichier téléchargé"));
    }

    console.log("Fichier reçu :", req.file);

    // Utilisation de l'API Cloudinary pour envoyer le buffer
    const uploadStream = cloudinary.v2.uploader.upload_stream(
      {
        resource_type: "image",
        public_id: `image_${Date.now()}`,
      },
      async (error, result) => {
        if (error) {
          console.error("Erreur Cloudinary :", error);
          return next(new HttpError(500, "Erreur d'upload vers Cloudinary"));
        }

        console.log("Image téléchargée sur Cloudinary avec succès :", result.secure_url);

        // Récupérer les paramètres
        const { id } = req.params;
        const { originalUrl } = req;
        console.log("ID reçu :", id);
        console.log("URL originale :", originalUrl);

        let updatedEntity;

        if (originalUrl.includes("/family")) {
          console.log("Traitement pour une famille");
          // Recherche de la famille associée à l'utilisateur
          updatedEntity = await family.findOne({ where: { id: id } });
          console.log("Résultat de la requête pour famille :", updatedEntity);

          if (!updatedEntity) {
            console.error("Famille non trouvée pour id :", id);
            return next(new HttpError(404, "Famille non trouvée"));
          }

          // Mise à jour du champ profile_photo
          updatedEntity.profile_photo = result.secure_url;
          console.log("URL assignée à la famille :", updatedEntity.profile_photo);

        } else if (originalUrl.includes("/association")) {
          console.log("Traitement pour une association");

          // Recherche de l'association associée à l'utilisateur
          updatedEntity = await association.findOne({ where: { id: id } });
          console.log("Résultat de la requête pour association :", updatedEntity);

          if (!updatedEntity) {
            console.error("Association non trouvée pour id :", id);
            return next(new HttpError(404, "Association non trouvée"));
          }

          // Mise à jour du champ profile_photo
          updatedEntity.profile_photo = result.secure_url;
          console.log("URL assignée à l'association :", updatedEntity.profile_photo);

        } else if (originalUrl.includes("/animal")) {
          console.log("Traitement pour un animal");
          const { photoType } = req.params;
          console.log("Type de photo reçu :", photoType);

          updatedEntity = await animal.findByPk(id);
          console.log("Résultat de la requête pour animal :", updatedEntity);

          if (!updatedEntity) {
            console.error("Animal non trouvé pour id :", id);
            return next(new HttpError(404, "Animal non trouvé"));
          }

          // Validation du type de photo
          if (photoType === "photo1" || photoType === "photo2" || photoType === "photo3") {
            updatedEntity[photoType] = result.secure_url;
            console.log(`URL assignée à l'animal pour ${photoType} :`, updatedEntity[photoType]);
          } else {
            console.error("Type de photo invalide :", photoType);
            return next(new HttpError(400, "Type de photo invalide"));
          }

        } else {
          console.error("Route non reconnue :", originalUrl);
          return next(new HttpError(400, "Route non reconnue"));
        }

        // Sauvegarder les changements dans la base de données
        console.log("Sauvegarde de l'entité mise à jour dans la base de données");
        await updatedEntity.save();
        console.log("Entité mise à jour avec succès :", updatedEntity);

        // Réponse au client
        res.status(200).json({
          imageUrl: result.secure_url,
          message: "Image mise à jour avec succès",
        });
      }
    );

    // Vérification du buffer du fichier
    if (req.file.buffer) {
      console.log("Envoi du buffer de l'image vers Cloudinary");
      uploadStream.end(req.file.buffer);
    } else {
      console.error("Aucun buffer trouvé pour l'image");
      return next(new HttpError(400, "Aucun buffer trouvé pour l'image"));
    }

  } catch (error) {
    console.error("Erreur interne :", error);
    return next(new HttpError(500, "Erreur interne du serveur"));
  }
};

