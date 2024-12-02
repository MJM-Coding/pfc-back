import cloudinary from "../config/cloudinaryConfig.js";
import { User, Animal, Association, Family } from "../models/index.js";
import HttpError from "../middlewares/httperror.js";

export const uploadImage = async (req, res, next) => {
  try {
    // Vérification de la présence du fichier
    if (!req.file) {
      return next(new HttpError(400, "Aucun fichier téléchargé"));
    }

    // Log du fichier reçu pour vérifier sa structure
    console.log('Fichier reçu:', req.file);

    // Utilisation de l'API Cloudinary pour envoyer le buffer
    const uploadStream = cloudinary.v2.uploader.upload_stream(
      {
        resource_type: "image", // Spécifie que c'est une image
        public_id: `image_${Date.now()}`, // Un ID public unique
      },
      async (error, result) => {
        if (error) {
          console.log('Erreur Cloudinary:', error);
          return next(new HttpError(500, "Erreur d'upload vers Cloudinary"));
        }

        // Log de l'URL de l'image après l'upload
        console.log('Image Cloudinary:', result.secure_url);

        // Récupérer les paramètres de l'URL et le rôle de l'utilisateur
        const { id, photoType } = req.params;
        const user = await User.findByPk(id); // Trouver l'utilisateur par son ID
        if (!user) {
          return next(new HttpError(404, "Utilisateur non trouvé"));
        }

        let updatedEntity;

        if (user.role === "family") {
          // Utilisateur lié à une famille
          updatedEntity = await Family.findOne({ where: { id_user: user.id } });
          if (!updatedEntity) return next(new HttpError(404, "Famille non trouvée"));

          // Log avant la mise à jour dans la BDD
          console.log('Avant mise à jour dans la BDD - URL actuelle:', updatedEntity.profile_photo);

          // Mettre à jour le champ photo de la famille
          updatedEntity.profile_photo = result.secure_url;

          // Log après l'assignation de l'URL avant sauvegarde
          console.log('URL assignée à la famille:', updatedEntity.profile_photo);
          console.log('updatedEntity:', updatedEntity);
          if (!updatedEntity) {
            return next(new HttpError(404, "Association non trouvée"));
          }
          await updatedEntity.save();

          // Log après la mise à jour dans la BDD
          console.log('Photo de famille mise à jour dans la BDD:', updatedEntity.profile_photo);
        } else if (user.role === "association") {
          // Utilisateur lié à une association
          updatedEntity = await Association.findOne({ where: { id_user: user.id } });
          if (!updatedEntity) return next(new HttpError(404, "Association non trouvée"));

          // Log avant la mise à jour dans la BDD
          console.log('Avant mise à jour dans la BDD - URL actuelle:', updatedEntity.profile_photo);

          // Mettre à jour le champ photo de l'association
          updatedEntity.profile_photo = result.secure_url;

          // Log après l'assignation de l'URL avant sauvegarde
          console.log('URL assignée à l\'association:', updatedEntity.profile_photo);

          await updatedEntity.save();
          console.log('Enregistrement effectué pour l\'association, URL après sauvegarde:', updatedEntity.profile_photo);

          // Récupérer à nouveau l'entité pour vérifier la mise à jour
const updatedAssociation = await Association.findByPk(updatedEntity.id);
console.log('Association après mise à jour en BDD:', updatedAssociation.profile_photo);
          // Log après la mise à jour dans la BDD
          console.log('Photo de l\'association mise à jour dans la BDD:', updatedEntity.profile_photo);
        } else if (user.role === "admin") {
          return next(new HttpError(400, "Les administrateurs ne peuvent pas télécharger de photos"));
        } else {
          return next(new HttpError(400, "Rôle utilisateur non valide"));
        }

        // Répondre avec l'URL de l'image téléchargée
        res.status(200).json({ imageUrl: result.secure_url, message: "Image mise à jour avec succès" });
      }
    );

    // Si le fichier est un buffer, on envoie directement le buffer vers Cloudinary
    if (req.file.buffer) {
      uploadStream.end(req.file.buffer);
    } else {
      return next(new HttpError(400, "Aucun buffer trouvé pour l'image"));
    }

  } catch (error) {
    console.error('Erreur interne:', error);
    return next(new HttpError(500, "Erreur interne du serveur"));
  }
};

  
//! Fonction pour mettre à jour une image existante
export const updateImage = async (req, res, next) => {
  try {
    if (!req.file) {
      return next(new HttpError(400, "Aucune image fournie"));
    }

    const { id } = req.params; // Récupère l'ID de l'animal ou de l'entité que vous voulez mettre à jour

    // Envoi de l'image vers Cloudinary
    const result = await cloudinary.v2.uploader.upload_stream(
      { resource_type: "image" },
      async (error, result) => {
        if (error) {
          return next(new HttpError(500, "Erreur lors de l'upload de l'image"));
        }
        // Répond avec l'URL de l'image téléchargée
        res.status(200).json({ imageUrl: result.secure_url });

        // Mettez à jour la base de données ici avec l'URL de l'image
        // Exemple (modifiez selon votre structure de base de données) :
        // Animal.update({ profile_photo: result.secure_url }, { where: { id: id }});
      }
    );

    req.file.stream.pipe(result); // Upload de l'image
  } catch (error) {
    return next(new HttpError(500, "Erreur interne du serveur"));
  }
};
