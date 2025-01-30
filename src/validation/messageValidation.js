import Joi from "joi";

export const messageSchema = Joi.object({
  content: Joi.string()
    .min(1)
    .max(500)
    .required()
    .messages({
      "string.empty": "Le message ne peut pas être vide.",
      "string.min": "Le message doit contenir au moins 1 caractère.",
      "string.max": "Le message ne peut pas dépasser 500 caractères."
    }),
});
