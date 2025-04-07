#!/usr/bin/env node
// Ce script convertit les blocs COPY ... FROM stdin en instructions INSERT.

// Importation des modules nécessaires en mode ESM
import fs from 'fs';
import readline from 'readline';

// Vérification de la présence du fichier d'entrée en argument
if (process.argv.length < 3) {
  console.log("Usage: node convert.js input.sql [output.sql]");
  process.exit(1);
}

// Récupération du fichier d'entrée et, éventuellement, du fichier de sortie
const inputFile = process.argv[2];
const outputFile = process.argv[3]; // facultatif

// Création d'un flux de lecture sur le fichier d'entrée
const readStream = fs.createReadStream(inputFile, { encoding: 'utf-8' });

// Création d'une interface pour lire le fichier ligne par ligne
const rl = readline.createInterface({
  input: readStream,
  crlfDelay: Infinity
});

// Tableau qui contiendra les instructions INSERT générées
let outputLines = [];

// Variables pour le traitement d'un bloc COPY
let inCopyBlock = false; // indique si on est dans un bloc COPY
let currentTable = '';   // nom de la table en cours
let columns = [];        // liste des colonnes de la table

/**
 * Fonction pour échapper une valeur afin qu'elle soit sûre pour une requête SQL.
 * - Si la valeur est "\N", on la considère comme NULL.
 * - Sinon, on entoure la valeur de simples quotes et on échappe les quotes internes.
 *
 * @param {string} val - La valeur à échapper.
 * @returns {string} - La valeur échappée ou NULL.
 */
function escapeValue(val) {
  if (val === '\\N') return 'NULL';
  return "'" + val.replace(/'/g, "''") + "'";
}

/**
 * Traitement du fichier ligne par ligne.
 */
async function processFile() {
  for await (const line of rl) {
    // Détecter le début d'un bloc COPY
    // Exemple de ligne attendue :
    // COPY schema.table (col1, col2, col3) FROM stdin;
    if (line.startsWith('COPY')) {
      // Extraction du nom de la table et de la liste des colonnes
      const regex = /^COPY\s+([\w\.]+)\s+\((.*?)\)\s+FROM\s+stdin;/;
      const match = line.match(regex);
      if (match) {
        currentTable = match[1]; // par exemple "auth.audit_log_entries"
        // Séparation des colonnes et suppression des espaces superflus
        columns = match[2].split(',').map(col => col.trim());
        inCopyBlock = true;
      }
      continue; // on passe à la ligne suivante
    }

    // Fin du bloc COPY (la ligne "\." indique la fin)
    if (inCopyBlock && line.trim() === '\\.') {
      inCopyBlock = false;
      continue;
    }

    // Si on est dans un bloc COPY, on convertit la ligne de données en INSERT
    if (inCopyBlock) {
      // Ignorer les lignes vides
      if (line.trim() === '') continue;
      // Séparation des valeurs par tabulation
      const values = line.split('\t');
      // Échapper chaque valeur pour être sûr qu'elle est correctement formatée
      const escapedValues = values.map(v => escapeValue(v));
      // Construction de l'instruction INSERT
      const sql = `INSERT INTO ${currentTable} (${columns.join(', ')}) VALUES (${escapedValues.join(', ')});`;
      outputLines.push(sql);
    }
  }

  // Si un fichier de sortie est précisé, on écrit le résultat dans ce fichier, sinon on affiche le résultat dans la console.
  if (outputFile) {
    fs.writeFileSync(outputFile, outputLines.join('\n'), { encoding: 'utf-8' });
    console.log(`Conversion terminée. Le fichier converti est ${outputFile}`);
  } else {
    console.log(outputLines.join('\n'));
  }
}

// Lancer le traitement du fichier
processFile();
