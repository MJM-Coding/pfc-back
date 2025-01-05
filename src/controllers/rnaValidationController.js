/**
 * Cette route est destinée au front-end pour valider un numéro RNA directement depuis le formulaire 
Le front appelle cette route pour savoir si un numéro RNA est valide ou non.
 * 
 * Ce fichier est utilisé comme un contrôleur Express. Il expose une route `/validate-rna/:rnaNumber`
 * qui permet au front-end de valider un numéro RNA.
 * 
 * Cette validation est utile pour fournir une réponse immédiate au front-end
 * lorsqu'un utilisateur saisit un numéro RNA dans un formulaire, par exemple.
 * 
 * Contrairement à `validateRNAFromApi` (dans `utils`), ce contrôleur s'adresse directement 
 * à la route du backend pour être consommé par le front-end.
 * 
 * Retourne une réponse JSON (valid : true/false) que le front-end peut utiliser pour afficher un toast ou des messages.
 */

import axios from "axios";

export const validateRNA = async (req, res) => {
  const { rnaNumber } = req.params;
  console.log("Numéro RNA reçu :", rnaNumber);

  if (!rnaNumber || typeof rnaNumber !== "string") {
    return res.status(400).json({
      valid: false,
      error: "Le numéro RNA est manquant ou invalide.",
    });
  }

  const apiUrl = `${process.env.API_ASSO_URL}/structure/${rnaNumber}`;
  console.log("URL appelée :", apiUrl);

  try {
    // Appel à l'API externe
    const response = await axios.get(apiUrl);
    console.log("Réponse de l'API :", response.data);

    // Vérifier si la réponse contient une erreur
    if (response.data?.erreur || response.data?.data?.erreur) {
      console.error("Erreur détectée dans la réponse API :", response.data?.erreur || response.data?.data?.erreur);
      return res.status(404).json({
        valid: false,
        error: "Ce numéro RNA n'est pas repertorié dans le registre des associations.",
      });
    }

    // Vérifier si le RNA dans la réponse correspond au RNA fourni
    const idRna = response.data?.identite?.id_rna?.trim().toUpperCase();
    const normalizedRnaNumber = rnaNumber.trim().toUpperCase();

    if (!idRna || idRna !== normalizedRnaNumber) {
      console.error("RNA dans la réponse ne correspond pas :", idRna);
      return res.status(404).json({
        valid: false,
        error: "Ce numéro RNA n'est pas repertorié dans le registre des associations.",
      });
    }

    // Retourner les données si tout est valide
    return res.json({
      valid: true,
      data: response.data,
    });
  } catch (error) {
    console.error("Erreur lors de l'appel API :", error.message);

    // Gestion des erreurs inattendues
    return res.status(500).json({
      valid: false,
      error: "Erreur lors de la validation RNA.",
    });
  }
};
