import { DataTypes } from "sequelize";
import client from "./client.js"; // Connexion à la base de données
import Conversation from "./conversation.js"; // Import du modèle Conversation
import User from "./user.js"; // Import du modèle User

const Message = client.define(
  "message",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    id_conversation: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Conversation,
        key: "id",
      },
      onDelete: "CASCADE",
    },
    id_sender: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: User,
        key: "id",
      },
      onDelete: "CASCADE",
    },
    content: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    is_read: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    sent_at: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
  },
  {
    tableName: "message",
    timestamps: false, // Pas besoin de `createdAt` et `updatedAt` ici
    indexes: [
      {
        name: "idx_message_conversation",
        fields: ["id_conversation"],
      },
      {
        name: "idx_message_sender",
        fields: ["id_sender"],
      },
    ],
  }
);

export default Message;
