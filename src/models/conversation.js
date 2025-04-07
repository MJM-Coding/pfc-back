import { DataTypes } from "sequelize";
import client from "./client.js"; // Connexion à la base de données

const Conversation = client.define(
  "conversation",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    id_family: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: "family",
        key: "id",
      },
      onDelete: "CASCADE",
    },
    id_association: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: "association",
        key: "id",
      },
      onDelete: "CASCADE",
    },
    last_message_at: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
  },
  {
    tableName: "conversation",
    timestamps: true, // Active `createdAt` et `updatedAt`
    updatedAt: false, // Désactive `updatedAt` (car géré par `last_message_at`)
    indexes: [
      {
        unique: true,
        fields: ["id_family", "id_association"], // Contrainte d'unicité
      },
    ],
  }
);

export default Conversation;
