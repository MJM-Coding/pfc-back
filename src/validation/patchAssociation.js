import Joi from "joi";

export const patchSchema = Joi.object({
  rna_number: Joi.string().pattern(/^W\d{9}$/),
  representative: Joi.string(),
  address: Joi.string(),
  postal_code: Joi.string().max(5),
  city: Joi.string(),
  phone: Joi.string().pattern(
    /^0[1-9][0-9]{8}$/,
    "Merci de renseigner un numéro de téléphone français"
  ),
  description: Joi.string().allow('').optional().allow(null),
  status: Joi.string().default("en attente").optional().allow(null),
  profile_photo: Joi.string().optional().allow(null),
  user: Joi.object({
    firstname: Joi.string(),
    lastname: Joi.string(),
    email: Joi.string().email(),
    password: Joi.string(),
    currentPassword: Joi.string().optional(), 
    newPassword: Joi.string().optional(), 
    confirmPassword: Joi.string().optional(), 

  }),
  imageUrl: Joi.string().uri().optional().allow(null), //ligne pour permettre imageUrl
});