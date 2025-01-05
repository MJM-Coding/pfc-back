// =========================================================
// Cette fonction est interne au backend. Elle est utilisée dans  
//  createUserController pour vérifier qu'un numéro RNA est valide avant 
// d'enregistrer  une association.

// Valide un numéro RNA en interrogeant l'API et retourne un résultat utilisable 
// directement dans le backend, sans exposer une route API.
// =========================================================

import axios from "axios";

export const validateRNAFromApi = async (rnaNumber) => {
  try {
    const response = await axios.get(`${process.env.API_ASSO_URL}/structure/${rnaNumber}`);
    if (response.data?.erreur || response.data?.data?.erreur) {
      return { valid: false, message: "Ce numéro RNA n'est pas repertorié dans le registre des associations." };
    }
    return { valid: true, data: response.data };
  } catch (error) {
    return { valid: false, message: "Erreur lors de la validation du numéro RNA." };
  }
};
