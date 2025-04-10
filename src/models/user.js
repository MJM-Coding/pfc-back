import { Model, DataTypes } from "sequelize";
import sequelize from './client.js';

export default class User extends Model {}

User.init({
    firstname: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notEmpty: { msg: "Le Nom est obligatoire" },
        },
    },
    lastname: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notEmpty: { msg: "Le Prénom est obligatoire" },
        },
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            isEmail: { msg: "L'email n'est pas au bon format" },
            notEmpty: { msg: "L'email est obligatoire" },
        },
    },
    password: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notEmpty: { msg: "Le Mot de Passe est obligatoire" },
        },
    },
    role: {
        type: DataTypes.STRING,
    },
    confirmationtoken: {
        type: DataTypes.STRING,
        allowNull: true,
        field: 'confirmationtoken'
    },
    tokenexpiration: {
        type: DataTypes.DATE,
        allowNull: true,
        field: 'tokenexpiration'
    },
    isverified: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: false,
        field: 'isverified'
    },
    failed_attempts: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 0, // Par défaut, aucune tentative échouée
        validate: {
            isInt: { msg: "failed_attempts doit être un entier" },
        },
    },
    blocked_until: {
        type: DataTypes.DATE,
        allowNull: true, // Null si l'utilisateur n'est pas bloqué
    },

    rgpd_consent: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: false,
      },

}, {
    sequelize: sequelize,
    tableName: "user",
});
