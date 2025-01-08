
docker compose -f Docker-compose.dev.yml down ; \
docker system prune -a -f --volumes ; \
docker volume rm $(docker volume ls -q) ; \
docker compose -f Docker-compose.dev.yml build --no-cache ; \
docker compose -f Docker-compose.dev.yml up --build




