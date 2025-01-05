
docker compose -f Docker-compose.dev.yml down ; \
docker system prune -a -f --volumes ; \
docker volume rm $(docker volume ls -q) ; \
docker compose -f Docker-compose.dev.yml build --no-cache ; \
docker compose -f Docker-compose.dev.yml up --build


| Fonction/Rôle         | validateRNA (Route API)                           | validateRNAFromApi (Utils interne)               |
|-----------------------|--------------------------------------------------|--------------------------------------------------|
| **Exposé au front**   | Oui, via `/validate-rna/:rnaNumber`.             | Non, utilisée uniquement dans le backend.       |
| **Quand est-elle appelée ?** | Quand le front veut vérifier un RNA.            | Lors de la création d'un utilisateur.           |
| **Retourne**          | Une réponse JSON pour le front.                 | Un objet utilisable dans les contrôleurs.       |
| **Objectif**          | Aider le front à afficher des messages utilisateur. | Vérifier le RNA avant d'insérer en BDD.         |





