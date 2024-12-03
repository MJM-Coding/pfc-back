import Family from "../models/family.js";
import sequelize from "../models/client.js";
import HttpError from "../middlewares/httperror.js";
import { Scrypt } from "../auth/Scrypt.js";
import { validatePassword } from "../validation/validatePassword.js";
import cloudinary from "../config/cloudinaryConfig.js"; // Importez votre configuration Cloudinary
import validator from "validator";
import fs from "fs/promises";
import path from "path";

const { isURL } = validator;

export const familyController = {
  //! Méthode pour lister les familles d'accueil
  getAllFamilies: async (req, res) => {
    const families = await Family.findAll({
      include: [
        { association: "animalsFamily" },
        { association: "user", attributes: { exclude: ["password"] } },
      ],
    });
    res.status(200).json(families);
  },

  //! Méthode pour obtenir le détail d'une famille d'accueil
  getFamilyById: async (req, res, next) => {
    const { id: familyId } = req.params;
    const family = await Family.findByPk(familyId, {
      include: [
        { association: "animalsFamily" },
        { association: "user", attributes: { exclude: ["password"] } },
      ],
    });

    if (!family) {
      return next(new HttpError(404, "Foster family not found"));
    }
    res.status(200).json(family);
  },

  //! Méthode pour mettre à jour les informations de la famille
  patchFamily: async (req, res, next) => {
    const familyId = req.params.id;
    const { 
      firstname, 
      lastname, 
      email, 
      address, 
      city, 
      postal_code, 
      phone, 
      description, 
      garden, 
      number_of_animals, 
      number_of_children 
    } = req.body;
    
    console.log("Données reçues du formulaire : ", req.body);
   
    const family = await Family.findByPk(familyId, {
      attributes: { exclude: "password" },
      include: "user",
    });
   
    if (!family) {
      console.log('Famille d\'accueil non trouvée');
      return next(new HttpError(404, "Famille d'accueil non trouvée"));
    }
   
    const transaction = await sequelize.transaction();
    console.log('Transaction commencée');
   
    try {
      const user = await family.getUser();
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
        await family.save({ transaction });
        console.log(`Photo de profil mise à jour dans la BDD : ${uploadResult}`);
      }
   
      // Mettre à jour les autres champs de la famille
      family.address = address || family.address;
      family.city = city || family.city;
      family.postal_code = postal_code || family.postal_code;
      family.phone = phone || family.phone;
      family.description = description || family.description;
      family.garden = garden || family.garden;
      family.number_of_animals = number_of_animals || family.number_of_animals;
      family.number_of_children = number_of_children || family.number_of_children;
   
      await family.save({ transaction });
   
      console.log('Données de la famille mises à jour');
   
      // Recharger la famille pour inclure les associations à jour
      const updatedFamily = await Family.findByPk(familyId, {
        include: [
          { association: "user" },
          { association: "animalsFamily" },
        ],
      });
   
      await transaction.commit();
      console.log('Transaction commitée avec succès');
   
      res.status(201).json(updatedFamily);
    } catch (error) {
      await transaction.rollback();
      console.error('Erreur lors de la mise à jour de la famille :', error);
      throw new HttpError(500, "Error while updating user");
    }
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
