import User from "./user.js";

//! Trouver un utilisateur par email
export const findUserByEmail = async (email) => {
  return await User.findOne({ where: { email } });
};

//! Mettre à jour le mot de passe d'un utilisateur
export const updateUserPassword = async (userId, newPassword) => {
  return await User.update(
    { password: newPassword },
    { where: { id: userId } }
  );
};

//! Trouver un utilisateur par ID 
export const findUserById = async (id) => {
  return await User.findByPk(id);
};
