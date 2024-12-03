import fs from "fs/promises";
import path from "path";
import Association from "../models/association.js";
import HttpError from "../middlewares/httperror.js";
import cloudinary from "../config/cloudinaryConfig.js";
import sequelize from "../models/client.js"; // Ajouter l'importation de sequelize pour la transaction
import { Scrypt } from "../auth/Scrypt.js";
import { validatePassword } from "../validation/validatePassword.js";

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
    const { 
      firstname, 
      lastname, 
      email, 
      address, 
      city, 
      postal_code, 
      phone, 
      description, 
      rna_number, 
      representative,
      status
    } = req.body;

    console.log("Données reçues du formulaire : ", req.body);

    const association = await Association.findByPk(associationId, {
      attributes: { exclude: "password" },
      include: [
        { association: "user" },
        { association: "animals" },
      ],
    });

    if (!association) {
      console.log('Association non trouvée');
      throw new HttpError(404, "Association not found");
    }

    const transaction = await sequelize.transaction();
    console.log('Transaction commencée');

    try {
      const user = await association.getUser();
      console.log('Utilisateur trouvé :', user);

      // Mise à jour des informations utilisateur
      const userData = {
        ...user.get(),
        firstname: firstname || user.firstname,
        lastname: lastname || user.lastname,
        email: email || user.email,
        id: user.id,
      };
      console.log('Données utilisateur mises à jour :', userData);

      // Gestion du changement de mot de passe
      if (req.body.currentPassword && req.body.newPassword && req.body.confirmPassword) {
        const isCurrentPasswordValid = await Scrypt.compare(req.body.currentPassword, user.password);
        if (!isCurrentPasswordValid) {
          await transaction.rollback();
          return res.status(400).json({ message: "Le mot de passe actuel est incorrect." });
        }

        if (req.body.newPassword !== req.body.confirmPassword) {
          await transaction.rollback();
          return res.status(400).json({ message: "Le nouveau mot de passe et sa confirmation ne correspondent pas." });
        }

        if (!validatePassword(req.body.newPassword)) {
          await transaction.rollback();
          return res.status(400).json({
            message: "Le nouveau mot de passe doit contenir au moins 8 caractères, une majuscule, un chiffre et un caractère spécial.",
          });
        }

        userData.password = Scrypt.hash(req.body.newPassword);
      }

      // Mise à jour de l'utilisateur
      await user.update(userData, { transaction });
      console.log('Utilisateur mis à jour dans la base de données');

      //! Gestion de l'image de profil avec Multer et Cloudinary
      if (req.file) {
        if (association.profile_photo) {
          if (association.profile_photo.startsWith("images/")) {
            const localFilePath = path.join(process.cwd(), "public", association.profile_photo);
            try {
              await fs.unlink(localFilePath);
              console.log(`Fichier local supprimé : ${localFilePath}`);
            } catch (err) {
              console.warn(`Erreur lors de la suppression du fichier local : ${err.message}`);
            }
          } else {
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

        // Mettre à jour le champ `profile_photo` et sauvegarder
        association.profile_photo = uploadResult;
        await association.save({ transaction });
        console.log(`Photo de profil mise à jour dans la BDD : ${uploadResult}`);
      }

      // Mettre à jour les autres champs de l'association
      association.address = address || association.address;
      association.city = city || association.city;
      association.postal_code = postal_code || association.postal_code;
      association.phone = phone || association.phone;
      association.description = description || association.description;
      association.rna_number = rna_number || association.rna_number;
      association.representative = representative || association.representative;
      association.status = status || association.status;
      
      await association.save({ transaction });

      console.log('Données de l\'association mises à jour');

      // Recharger l'association pour inclure les relations à jour
      const updatedAssociation = await Association.findByPk(associationId, {
        include: [
          { association: "user" },
          { association: "animals" },
        ],
      });

      await transaction.commit();
      console.log('Transaction commitée avec succès');

      res.status(201).json(updatedAssociation);
    } catch (error) {
      await transaction.rollback();
      console.error('Erreur lors de la mise à jour de l\'association :', error);
      throw new HttpError(500, "Error while updating association");
    }
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
