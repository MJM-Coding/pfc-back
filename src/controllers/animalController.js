import fs from "fs/promises";
import path from "path";
import { Animal, Association } from "../models/index.js";
import HttpError from "../middlewares/httperror.js";
import { Op } from "sequelize";
import cloudinary from "../config/cloudinaryConfig.js";

export const animalController = {
  //! Récupérer tous les animaux
  getAllAnimals: async (req, res) => {
    if (req.user) {
      const association = await Association.findOne({ where: { id_user: req.user.id } });
      if (association) {
        const myAnimals = await association.getAnimals();
        return res.json(myAnimals);
      }
    }

    const { species, breed, age, size, gender } = req.query;
    const conditions = { id_family: null };

    if (species) conditions.species = { [Op.iLike]: species };
    if (breed) conditions.breed = { [Op.iLike]: breed };
    if (age) conditions.age = { [Op.lt]: parseInt(age, 10) };
    if (size) conditions.size = { [Op.iLike]: size };
    if (gender) conditions.gender = { [Op.iLike]: gender };

    const animals = await Animal.findAll({ where: conditions });

    if (animals.length === 0) {
      throw new HttpError(404, "Aucun animal trouvé");
    }

    res.status(200).json(animals);
  },

  //! Récupérer un animal
  getAnimalById: async (req, res) => {
    const animalId = req.params.id || req.params.animalId;

    if (req.user) {
      const association = await Association.findOne({ where: { id_user: req.user.id } });
      const myAnimal = await association.getAnimals({ where: { id: animalId } });
      return res.json(myAnimal);
    }

    const animal = await Animal.findByPk(animalId, {
      where: { id_family: null },
      include: [
        {
          association: "family",
          include: { association: "user", attributes: { exclude: ["password"] } },
        },
        {
          association: "association",
          include: { association: "user", attributes: { exclude: ["password"] } },
        },
      ],
    });

    if (!animal) throw new HttpError(404, "Animal non trouvé");

    res.status(200).json(animal);
  },

  //! Créer un animal
  createAnimal: async (req, res) => {
    const association = await Association.findOne({ where: { id_user: req.user.id } });

    if (!association) throw new HttpError(403, "Accès interdit : Vous n'êtes pas habilité");

    const { name, species, breed, gender, age, size, description } = req.body;

    if (!name || !species || !gender || !age || !size) {
      throw new HttpError(400, "Les champs obligatoires sont manquants");
    }

    const photoFields = ["profile_photo", "photo1", "photo2", "photo3"];
    const photos = {};
    if (req.files && req.files.length > 0) {
      for (let i = 0; i < req.files.length; i++) {
        if (i >= photoFields.length) break;
        photos[photoFields[i]] = await uploadToCloudinary(req.files[i]);
      }
    }

    const newAnimal = await Animal.create({
      name,
      species,
      breed,
      gender,
      age,
      size,
      description,
      id_association: association.id,
      ...photos,
    });

    res.status(201).json({ message: "Animal créé avec succès", animal: newAnimal });
  },



 //! Supprimer une photo d'un animal
deleteAnimalPhoto: async (req, res) => {
  const { id: animalId, photoType } = req.params;

  // Vérifier l'association de l'utilisateur
  const association = await Association.findOne({ where: { id_user: req.user.id } });
  if (!association) {
    throw new HttpError(403, "Accès interdit : Association introuvable pour cet utilisateur");
  }

  // Vérifier si l'animal existe
  const selectedAnimal = await Animal.findByPk(animalId);
  if (!selectedAnimal) {
    throw new HttpError(404, "Animal non trouvé");
  }

  // Vérifier que l'animal appartient à l'association de l'utilisateur
  if (association.id !== selectedAnimal.id_association) {
    throw new HttpError(403, "Accès interdit : Vous n'êtes pas habilité");
  }

  // Valider le type de photo
  const validPhotoTypes = ["profile_photo", "photo1", "photo2", "photo3"];
  if (!validPhotoTypes.includes(photoType)) {
    throw new HttpError(400, "Type de photo invalide");
  }

  // Obtenir le chemin ou l'URL de la photo
  const photoPath = selectedAnimal[photoType];
  if (!photoPath) {
    throw new HttpError(404, "Photo non trouvée");
  }

  // Suppression de la photo (locale ou Cloudinary)
  if (photoPath.startsWith("images/")) {
    // Suppression d'une photo locale
    const localFilePath = path.join(process.cwd(), "public", photoPath);
    try {
      await fs.unlink(localFilePath); // Supprime le fichier local
      console.log(`Fichier local supprimé : ${localFilePath}`);
    } catch (err) {
      console.warn(`Erreur lors de la suppression du fichier local : ${err.message}`);
    }
  } else {
    // Suppression d'une photo stockée sur Cloudinary
    const publicId = photoPath.split("/").pop().split(".")[0]; // Extraire le public_id
    try {
      await cloudinary.v2.uploader.destroy(publicId); // Supprime la photo sur Cloudinary
      console.log(`Image Cloudinary supprimée : ${publicId}`);
    } catch (err) {
      console.warn(`Erreur lors de la suppression sur Cloudinary : ${err.message}`);
    }
  }

  // Mettre à jour la base de données pour supprimer la référence
  selectedAnimal[photoType] = null;
  await selectedAnimal.save();

  res.status(200).json({ message: "Photo supprimée avec succès" });
},



//! Modifier un animal
patchAnimal: async (req, res) => {
  const association = await Association.findOne({ where: { id_user: req.user.id } });
  const animalId = req.params.id;
  const selectedAnimal = await Animal.findByPk(animalId);

  if (!selectedAnimal) throw new HttpError(404, "Animal non trouvé");

  if (association.id !== selectedAnimal.id_association) {
    throw new HttpError(403, "Accès interdit : Vous n'êtes pas habilité");
  }

  //! Gestion des photos
  if (req.files && req.files.length > 0) {
    const photoFields = ["profile_photo", "photo1", "photo2", "photo3"];
    for (let i = 0; i < req.files.length; i++) {
      if (i >= photoFields.length) break;

      const currentPhoto = selectedAnimal[photoFields[i]];
      if (currentPhoto) {
        if (currentPhoto.startsWith("images/")) {
          // Supprimer le fichier local
          const localFilePath = path.join(process.cwd(), "public", currentPhoto);
          try {
            await fs.unlink(localFilePath);
            console.log(`Fichier local supprimé : ${localFilePath}`);
          } catch (err) {
            console.warn(`Erreur lors de la suppression du fichier local : ${err.message}`);
          }
        } else {
          // Supprimer l'image sur Cloudinary
          const publicId = currentPhoto.split("/").pop().split(".")[0];
          try {
            await cloudinary.v2.uploader.destroy(publicId);
            console.log(`Image Cloudinary supprimée : ${publicId}`);
          } catch (err) {
            console.warn(`Erreur lors de la suppression sur Cloudinary : ${err.message}`);
          }
        }
      }

      // Upload de la nouvelle photo sur Cloudinary
      const uploadResult = await uploadToCloudinary(req.files[i]);

      // Mettre à jour le champ correspondant dans l'animal
      selectedAnimal[photoFields[i]] = uploadResult;
    }
  }

  // Mettre à jour les autres champs
  const updates = req.body;
  await selectedAnimal.update({
    ...updates,
    profile_photo: selectedAnimal.profile_photo, // S'assurer que les photos sont mises à jour
    photo1: selectedAnimal.photo1,
    photo2: selectedAnimal.photo2,
    photo3: selectedAnimal.photo3,
  });

  // Recharger l'animal pour inclure les associations à jour
  const updatedAnimal = await Animal.findByPk(animalId, {
    include: [
      {
        association: "family",
        include: { association: "user", attributes: { exclude: ["password"] } },
      },
      {
        association: "association",
        include: { association: "user", attributes: { exclude: ["password"] } },
      },
    ],
  });

  res.status(200).json(updatedAnimal);
},


  //! Supprimer un animal
  deleteAnimal: async (req, res) => {
    const association = await Association.findOne({ where: { id_user: req.user.id } });
    const animalId = req.params.id;
    const selectedAnimal = await Animal.findByPk(animalId);

    if (!selectedAnimal) throw new HttpError(404, "Animal non trouvé");

    if (association.id !== selectedAnimal.id_association) {
      throw new HttpError(403, "Accès interdit : Vous n'êtes pas habilité");
    }

    await selectedAnimal.destroy();
    res.status(204).end();
  },
};

//! Fonction utilitaire pour uploader une image sur Cloudinary
const uploadToCloudinary = (file) => {
  return new Promise((resolve, reject) => {
    const uploadStream = cloudinary.v2.uploader.upload_stream(
      { resource_type: "image", public_id: `animal_${Date.now()}` },
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

