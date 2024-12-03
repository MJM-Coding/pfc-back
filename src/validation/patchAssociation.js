import Joi from "joi";

export const patchSchema = Joi.object({
  rna_number: Joi.string().pattern(/^W\d{9}$/),
  representative: Joi.string(),
  address: Joi.string(),
  postal_code: Joi.alternatives()
  .try(
    Joi.string().length(5).pattern(/^\d{5}$/, "code postal"),
    Joi.number().integer().min(10000).max(99999) // Si envoyé comme nombre
  )
  .required(),

  city: Joi.string(),
  phone: Joi.string().pattern(
    /^0[1-9][0-9]{8}$/,
    "Merci de renseigner un numéro de téléphone français"
  ),
  description: Joi.string().allow('').optional().allow(null),
  status: Joi.string().default("en attente").optional().allow(null),
  profile_photo: Joi.string().optional().allow(null),
  id_user: Joi.number().integer(),
  firstname: Joi.string(), // Déplacé à la racine
  lastname: Joi.string(),  // Déplacé à la racine
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