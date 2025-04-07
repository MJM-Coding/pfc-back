import client from "./client.js";
import User from "./user.js";
import Family from "./family.js";
import Association from "./association.js";
import Animal from "./animal.js";
import Ask from "./ask.js";
import Conversation from "./conversation.js";
import Message from "./message.js";

//! Une famille peut avoir plusieurs animaux
Family.hasMany(Animal, {
  foreignKey: "id_family", // clé étrangère dans animal
  as: "animalsFamily", // alias pour la relation
});

Animal.belongsTo(Family, {
  foreignKey: "id_family", // clé étrangère dans animal
  as: "family", // alias pour la relation
});

//! Une association peut avoir plusieurs animaux
Association.hasMany(Animal, {
  foreignKey: "id_association", // clé étrangère dans animal
  onDelete: "cascade", // suppression en cascade
  as: "animals", // alias pour la relation
});

Animal.belongsTo(Association, {
  foreignKey: "id_association", // clé étrangère dans animal
  as: "association", // alias pour la relation
});

//! Un utilisateur peut être associé à une famille
User.hasOne(Family, {
  foreignKey: "id_user", // clé étrangère dans family
  as: "family", // alias pour la relation
  onDelete: "cascade", // suppression en cascade
});

Family.belongsTo(User, {
  foreignKey: "id_user", // clé étrangère dans family
  as: "user", // alias pour la relation
  onDelete: "cascade", // suppression en cascade
});

//! Un utilisateur peut être associé à une association
User.hasOne(Association, {
  foreignKey: "id_user", // clé étrangère dans association
  as: "association", // alias pour la relation
  onDelete: "cascade", // suppression en cascade
});

Association.belongsTo(User, {
  foreignKey: "id_user", // clé étrangère dans association
  as: "user", // alias pour la relation
  onDelete: "cascade", // suppression en cascade
});

//! Une famille peut faire plusieurs demandes (ask)
Family.hasMany(Ask, {
  foreignKey: "id_family", // clé étrangère dans Ask
  as: "asks", // alias pour la relation
  onDelete: "cascade", // suppression en cascade
});

Ask.belongsTo(Family, {
  foreignKey: "id_family", // clé étrangère dans Ask
  as: "family", // alias pour la relation
});

//! Un animal peut être associé à plusieurs demandes (ask)
Animal.hasMany(Ask, {
  foreignKey: "id_animal", // clé étrangère dans Ask
  as: "asks", // alias pour la relation
  onDelete: "cascade", // suppression en cascade
});

Ask.belongsTo(Animal, {
  foreignKey: "id_animal", // clé étrangère dans Ask
  as: "animal", // alias pour la relation
});

//! Une conversation appartient à une famille et une association
Conversation.belongsTo(Family, { 
  foreignKey: "id_family",
  as: "family",
  unique: "unique_conversation" // Contrainte d'unicité sur id_family + id_association
});
  
Conversation.belongsTo(Association, { 
  foreignKey: "id_association", 
  as: "association",
  unique: "unique_conversation"
});

//! Une conversation a plusieurs messages
Conversation.hasMany(Message, {
  foreignKey: "id_conversation",
  as: "messages", // Alias pour les messages d'une conversation
  onDelete: "CASCADE",
});

Message.belongsTo(Conversation, { 
  foreignKey: "id_conversation",
  as: "conversation" // Alias pour la conversation d'un message
});

//! Un message est envoyé par un utilisateur
Message.belongsTo(User, { 
  foreignKey: "id_sender", 
  as: "sender" // Alias pour l'expéditeur du message
});

User.hasMany(Message, { 
  foreignKey: "id_sender",
  as: "sentMessages" // Alias pour les messages envoyés par l'utilisateur
});


export {
  client,
  User,
  Family,
  Association,
  Animal,
  Ask,
  Conversation,
  Message,
};
