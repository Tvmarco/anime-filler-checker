FROM node:18-alpine

WORKDIR /app

# Copia i file di configurazione
COPY stremio-addon/package*.json ./

# Installa solo le dipendenze necessarie per la produzione
RUN npm install --production

# Copia il resto del codice dell'addon
COPY stremio-addon/ .

# stremio-addon-sdk usa di default la porta 7000
EXPOSE 8000

# Avvia l'addon usando index.js (come da package.json)
CMD ["node", "index.js"]
