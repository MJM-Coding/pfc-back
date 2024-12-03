import fs from "fs/promises";
import path from "path";
import Family from "../models/family.js";
import HttpError from "../middlewares/httperror.js";
import cloudinary from "../config/cloudinaryConfig.js";

export const familyController = {
  //! Méthode pour lister les familles d'accueil
  getAllFamilies: async (req, res) => {
    const families = await Family.findAll({
      include: [
        { association: "animalsFamily" },
        { association: "user" },
      ],
    });
    res.status(200).json(families);
  },

  //! Méthode pour obtenir le détail d'une famille d'accueil
  getFamilyById: async (req, res) => {
    const { id: familyId } = req.params;
    const family = await Family.findByPk(familyId, {
      include: [
        { association: "animalsFamily" },
        { association: "user" },
      ],
    });

    if (!family) {
      throw new HttpError(404, "Foster family not found");
    }
    res.status(200).json(family);
  },

  //! Méthode pour mettre à jour les informations de la famille, y compris la photo de profil
  patchFamily: async (req, res) => {
    const familyId = req.params.id;

    // Récupérer la famille avec les associations
    const family = await Family.findByPk(familyId, {
      include: [
        { association: "user" },
        { association: "animalsFamily" },
      ],
    });

    if (!family) {
      throw new HttpError(404, "Foster family not found");
    }

    //! Gestion de l'image de profil avec Multer et Cloudinary
    if (req.file) {
      // Supprimer l'ancienne photo si elle existe
      if (family.profile_photo) {
        if (family.profile_photo.startsWith("images/")) {
          const localFilePath = path.join(process.cwd(), "public", family.profile_photo);
          try {
            await fs.unlink(localFilePath);
            console.log(`Fichier local supprimé : ${localFilePath}`);
          } catch (err) {
            console.warn(`Erreur lors de la suppression du fichier local : ${err.message}`);
          }
        } else {
          const publicId = family.profile_photo.split("/").pop().split(".")[0];
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

      // Mettre à jour le champ `profile_photo` et sauvegarder
      family.profile_photo = uploadResult;
      await family.save(); // Sauvegarde explicite dans la base de données
      console.log(`Photo de profil mise à jour dans la BDD : ${uploadResult}`);
    }

    // Mettre à jour les autres champs de la famille
    const updateFamily = req.body;
    await family.update(updateFamily);

    // Recharger la famille pour inclure les associations à jour
    const updatedFamily = await Family.findByPk(familyId, {
      include: [
        { association: "user" },
        { association: "animalsFamily" },
      ],
    });

    // Retourner la famille mise à jour
    res.status(200).json(updatedFamily);
  },

  //! Supprimer une famille
  deleteFamily: async (req, res) => {
    const familyId = req.params.id;
    const selectFamily = await Family.findByPk(familyId, { include: "animalsFamily" });

    if (!selectFamily) {
      throw new HttpError(404, "Family not found");
    }

    if (selectFamily.animalsFamily.length > 0) {
      throw new HttpError(409, "Deletion impossible, you are still hosting animals");
    }

    const user = await selectFamily.getUser();

    await selectFamily.destroy();
    await user.destroy();
    res.status(204).end();
  },
};

//! Fonction utilitaire pour uploader une image sur Cloudinary
const uploadToCloudinary = (file) => {
  return new Promise((resolve, reject) => {
    const uploadStream = cloudinary.v2.uploader.upload_stream(
      { resource_type: "image", public_id: `family_${Date.now()}` },
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
