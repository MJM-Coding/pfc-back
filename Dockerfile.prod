# ! Étape 1 : Build
FROM node:lts-alpine AS build

WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm && pnpm install --prod
COPY . .

# ! Étape 2 : Run
FROM node:lts-alpine AS production

WORKDIR /app

# Réinstalle pnpm dans l'étape finale
RUN npm install -g pnpm

COPY --from=build /app /app

ENV NODE_ENV=production

EXPOSE 3000

CMD ["pnpm", "start"]
