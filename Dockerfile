# Etap 1: Budowanie aplikacji
FROM node:20-slim AS build

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

COPY . .

# Etap 2: Finalny, maksymalnie odchudzony obraz
FROM node:20-alpine AS production

WORKDIR /app

# Skopiuj tylko potrzebne pliki z builda (kod + node_modules)
COPY --from=build /app /app

# Dodaj curl do healthchecku
RUN apk add --no-cache curl

LABEL org.opencontainers.image.authors="Julia Grzesiewicz"

EXPOSE 3000

HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1

CMD ["npm", "start"]
