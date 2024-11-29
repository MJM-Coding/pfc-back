import Joi from "joi";

export const patchSchema = Joi.object({
  address: Joi.string(),
  postal_code: Joi.string().max(5),
  city: Joi.string(),
  phone: Joi.string().pattern(
    /^0[1-9][0-9]{8}$/,
    "Merci de renseigner un numéro de téléphone"
  ),
  number_of_children: Joi.number().integer().optional().allow(null),
  number_of_animals: Joi.number().integer().optional().allow(null),
  garden: Joi.boolean().optional().allow(null),
  description: Joi.string().allow('').optional().allow(null),
  profile_photo: Joi.string().optional().allow(null),// Si vous souhaitez conserver ce champ
  id_user: Joi.number().integer(),
  user: Joi.object({
    firstname: Joi.string(),
    lastname: Joi.string(),
    email: Joi.string().email(),
    password: Joi.string(),
    currentPassword: Joi.string().optional(), // Nouveau champ pour le mot de passe actuel
    newPassword: Joi.string().optional(), // Nouveau champ pour le nouveau mot de passe
    confirmPassword: Joi.string().optional(), // Nouveau champ pour la confirmation du mot de passe
  }),
  imageUrl: Joi.string().uri().optional().allow(null), //ligne pour permettre imageUrl
});