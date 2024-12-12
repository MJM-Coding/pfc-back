import { Model, DataTypes } from "sequelize";
import sequelize from "./client.js";
import Animal from "./animal.js";
import Family from "./family.js";
import Association from "./association.js"; // Import du modèle Association

export default class Ask extends Model {
  static associate(models) {
    Ask.belongsTo(models.Animal, { foreignKey: "id_animal", as: "animal" });
    Ask.belongsTo(models.Family, { foreignKey: "id_family", as: "family" });
   
  }
}

Ask.init(
  {
    status: {
      type: DataTypes.STRING(15),
      allowNull: false,
      defaultValue: "en attente",
      validate: {
        isIn: {
          args: [["en attente", "validée", "rejetée"]],
          msg: "Statut invalide.",
        },
      },
    },
    id_animal: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Animal,
        key: "id",
      },
    },
    id_family: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Family,
        key: "id",
      },
    },
  
    created_at: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
    updated_at: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
  },
  {
    sequelize: sequelize,
    tableName: "ask",
    timestamps: false,
  }
);
