# Etap 1: Budowanie aplikacji
FROM node:20-alpine AS build

# Ustawienie katalogu roboczego
WORKDIR /app

# Kopiowanie plików zależności i instalowanie tylko zależności produkcyjnych
COPY package*.json ./
RUN npm install --omit=dev && npm cache clean --force

# Kopiowanie reszty kodu źródłowego
COPY . .

# Etap 2: Finalny obraz
FROM node:20-alpine

# Ustawienie katalogu roboczego
WORKDIR /app

# Skopiowanie zbudowanej aplikacji z etapu budowania
COPY --from=build /app /app

# Podanie autora zgodnie z OCI
LABEL org.opencontainers.image.authors="Julia Grzesiewicz"

# Ustawienie portu na którym aplikacja będzie nasłuchiwać
EXPOSE 3000

# Dodanie healthchecku
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1

# Uruchomienie aplikacji
CMD ["npm", "start"]
