import fs from "fs/promises";
import path from "path";
import Association from "../models/association.js";
import HttpError from "../middlewares/httperror.js";
import cloudinary from "../config/cloudinaryConfig.js";

export const associationController = {
  //! Méthode pour lister les associations
  getAllAssociations: async (req, res) => {
    const associations = await Association.findAll({
      include: [
        { association: "user" }, // Inclut les utilisateurs associés
        { association: "animals" }, // Inclut les animaux associés
      ],
    });
    res.status(200).json(associations);
  },

  //! Méthode pour obtenir le détail d'une association
  getAssociationById: async (req, res) => {
    const { id: associationId } = req.params;
    const association = await Association.findByPk(associationId, {
      include: [
        { association: "user" },
        { association: "animals" },
      ],
    });

    if (!association) {
      throw new HttpError(404, "Association not found");
    }
    res.status(200).json(association);
  },

  //! Méthode pour mettre à jour les informations de l'association, y compris la photo de profil
  patchAssociation: async (req, res) => {
    const associationId = req.params.id;

    // Récupérer l'association avec les relations
    const association = await Association.findByPk(associationId, {
      include: [
        { association: "user" },
        { association: "animals" },
      ],
    });

    if (!association) {
      throw new HttpError(404, "Association not found");
    }

    //! Gestion de l'image de profil avec Multer et Cloudinary
    if (req.file) {
      // Supprimer l'ancienne photo si elle existe
      if (association.profile_photo) {
        if (association.profile_photo.startsWith("images/")) {
          // Si c'est une photo locale, supprimer le fichier
          const localFilePath = path.join(process.cwd(), "public", association.profile_photo);
          try {
            await fs.unlink(localFilePath);
            console.log(`Fichier local supprimé : ${localFilePath}`);
          } catch (err) {
            console.warn(`Erreur lors de la suppression du fichier local : ${err.message}`);
          }
        } else {
          // Si c'est une URL Cloudinary, supprimer l'ancienne image de Cloudinary
          const publicId = association.profile_photo.split("/").pop().split(".")[0];
          try {
            await cloudinary.v2.uploader.destroy(publicId);
            console.log(`Image Cloudinary supprimée : ${publicId}`);
          } catch (err) {
            console.warn(`Erreur lors de la suppression sur Cloudinary : ${err.message}`);
          }
        }
      }

      // Upload de la nouvelle photo sur Cloudinary
      const uploadResult = await uploadToCloudinary(req.file);

      // Mettre à jour le champ `profile_photo`
      association.profile_photo = uploadResult;
      await association.save(); // Sauvegarde explicite dans la base de données
      console.log(`Photo de profil mise à jour dans la BDD : ${uploadResult}`);
    }

    // Mettre à jour les autres champs de l'association
    const updateAssociation = req.body;
    await association.update(updateAssociation);

    // Recharger l'association pour inclure les relations à jour
    const updatedAssociation = await Association.findByPk(associationId, {
      include: [
        { association: "user" },
        { association: "animals" },
      ],
    });

    // Retourner l'association mise à jour
    res.status(200).json(updatedAssociation);
  },

  //! Supprimer une association
  deleteAssociation: async (req, res) => {
    const associationId = req.params.id;
    const selectAssociation = await Association.findByPk(associationId);

    if (!selectAssociation) {
      throw new HttpError(404, "Association not found");
    }

    const user = await selectAssociation.getUser();

    await selectAssociation.destroy();
    await user.destroy();
    res.status(204).end();
  },
};

//! Fonction utilitaire pour uploader une image sur Cloudinary
const uploadToCloudinary = (file) => {
  return new Promise((resolve, reject) => {
    const uploadStream = cloudinary.v2.uploader.upload_stream(
      { resource_type: "image", public_id: `association_${Date.now()}` },
      (error, result) => {
        if (error) {
          reject(error);
        } else {
          resolve(result.secure_url);
        }
      }
    );
    uploadStream.end(file.buffer);
  });
};
