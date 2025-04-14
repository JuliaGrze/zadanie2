# Etap 1: Budowanie aplikacji
FROM node:20-alpine AS build

# Ustawienie katalogu roboczego
WORKDIR /app

# Kopiowanie plików zależności i instalowanie tylko zależności produkcyjnych
COPY package*.json ./
RUN npm install --omit=dev && npm cache clean --force

# Kopiowanie reszty kodu źródłowego
COPY . .

# Etap 2: Finalny obraz na podstawie scratch
FROM scratch

# Skopiowanie tylko plików niezbędnych do uruchomienia aplikacji
# Kopiujemy aplikację do pustego obrazu scratch
COPY --from=build /app /app

# Ustawienie katalogu roboczego
WORKDIR /app

# Skopiowanie binariów Node.js
COPY --from=build /usr/local/bin/node /usr/local/bin/

# Podanie autora zgodnie z OCI
LABEL org.opencontainers.image.authors="Julia Grzesiewicz"

# Ustawienie portu na którym aplikacja będzie nasłuchiwać
EXPOSE 3000

# Uruchomienie aplikacji
CMD ["/usr/local/bin/node", "index.js"]
