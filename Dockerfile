# Etap 1: Budowanie aplikacji
FROM node:20-slim AS build

# Instalacja curl oraz zależności produkcyjnych w jednej warstwie
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Ustawienie katalogu roboczego
WORKDIR /app

# Kopiowanie plików zależności i instalowanie tylko zależności produkcyjnych
COPY package*.json ./
RUN npm install --omit=dev

# Kopiowanie reszty kodu źródłowego
COPY . .

# Etap 2: Finalny obraz
FROM node:20-slim

# Ustawienie katalogu roboczego
WORKDIR /app

# Skopiowanie zbudowanej aplikacji z etapu budowania
COPY --from=build /app /app

# Instalacja curl (połączone z innymi operacjami w jednym RUN)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Podanie autora zgodnie z OCI
LABEL org.opencontainers.image.authors="Julia Grzesiewicz"

# Ustawienie portu na którym aplikacja będzie nasłuchiwać
EXPOSE 3000

# Dodanie healthchecku
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1

# Uruchomienie aplikacji
CMD ["npm", "start"]
