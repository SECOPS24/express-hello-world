FROM node:20-alpine AS deps
WORKDIR /app
COPY package.json ./
RUN npm install --omit=dev

FROM node:20-alpine
RUN rm -rf /usr/local/lib/node_modules/npm /usr/local/lib/node_modules/corepack \
    /usr/local/bin/npm /usr/local/bin/npx /usr/local/bin/corepack
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY package.json server.js ./
ENV PORT=8080
EXPOSE 8080
USER node
CMD ["node", "server.js"]
