import { sequelize } from "../models/client.js"; // Chemin à adapter selon votre structure

const testJoin = async () => {
  const result = await sequelize.query(
    `
    SELECT a.*, ask.status
    FROM "animal" a
    LEFT JOIN "ask" ask ON ask.id_animal = a.id
    WHERE ask.status != 'validée' OR ask.status IS NULL
    `,
    { type: sequelize.QueryTypes.SELECT }
  );
  console.log("Résultat de la requête brute SQL :", result);
};

await testJoin();
