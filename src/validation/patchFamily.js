import Joi from "joi";

export const patchSchema = Joi.object({
  address: Joi.string(),
  postal_code: Joi.string().max(5),
  city: Joi.string(),
  postal_code: Joi.alternatives()
    .try(
      Joi.string()
        .length(5)
        .pattern(/^\d{5}$/, "code postal"),
      Joi.number().integer().min(10000).max(99999) // Si envoyé comme nombre
    )
    .required(),
  number_of_children: Joi.number().integer().optional().allow(null),
  number_of_animals: Joi.number().integer().optional().allow(null),
  garden: Joi.boolean().optional().allow(null),
  description: Joi.string().allow("").optional().allow(null),
  profile_photo: Joi.string().optional().allow(null), // Si vous souhaitez conserver ce champ
  phone: Joi.string().pattern(
    /^0[1-9][0-9]{8}$/,
    "Merci de renseigner un numéro de téléphone français"
  ),
  id_user: Joi.number().integer(),
  firstname: Joi.string(), // mis a la racine sinon impossible de  le modifier via formdata
  lastname: Joi.string(), // mis a la racine sinon impossible de  le modifier via formdata
  email: Joi.string().email(), // rajoute a la racine dans le cas dun formdata optionnel
  password: Joi.string(), // rajoute a la racine dans le cas dun formdata optionnel
  currentPassword: Joi.string().optional(), // rajoute a la racine dans le cas dun formdata optionnel
  newPassword: Joi.string().optional(), // rajoute a la racine dans le cas dun formdata optionnel
  confirmPassword: Joi.string().optional(), // rajoute a la racine dans le cas dun formdata optionnel
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
