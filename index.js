import express from "express";
import "dotenv/config"; // Module pour charger le .env
import path from "path"; // Module pour travailler avec les chemins de fichiers et de répertoires
import { fileURLToPath } from "url"; // Utilisé pour manipuler les URL et obtenir des chemins de fichiers
import cors from "cors";
import mainRouter from "./src/routers/mainRouter.js"; // Importation du routeur principal de l'application


// ! Configuration des chemins d'accès aux fichiers
//Cette configuration (__filename et __dirname) est nécessaire en utilisant les modules ESM,
//__filename et __dirname ne sont pas définis par défaut sur module ESM (import) comme dans CommonJS (export).
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

// Configuration de CORS a retravailler avec option avant déploiement
// Charge les origines autorisées
const allowedOrigins = process.env.CORS
  ? process.env.CORS.split(',')
  : ['http://localhost:5173', 'https://pfc-front-eta.vercel.app']; // Valeurs par défaut

// Middleware CORS
app.use(
  cors({
    origin: (origin, callback) => {
      if (!origin || allowedOrigins.includes(origin)) {
        callback(null, true); // Autorise l'origine
      } else {
        console.error(`[CORS Debug] Origine non autorisée : ${origin}`);
        console.log(`[CORS Debug] Variable CORS (env) : ${process.env.CORS}`);
        console.log(`[CORS Debug] Liste des origines autorisées : ${allowedOrigins}`);
        callback(new Error('Not allowed by CORS'));
      }
    },
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH'], // Méthodes autorisées
    allowedHeaders: ['Content-Type', 'Authorization'],
    credentials: true, // Autorise les cookies ou les sessions
  })
);

app.options("*", cors()); // Gère les requêtes préliminaires


// Middleware pour traiter le JSON
app.use(express.json({ limit: "100mb" }));
app.use(express.urlencoded({ extended: true, limit: "100mb" }));

// Middleware pour servir des fichiers statiques (CSS, images, etc.)
app.use(express.static(path.join(__dirname, "public")));


// Utilisation du routeur principal
app.use("/api", mainRouter);

// Démarrage du serveur sur le port spécifié dans .env ou sur 3001 par défaut
const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(
    `🚀 Serveur API démarré à l'adresse : http://localhost:${PORT}/api`
  );
});
