FROM node:lts-alpine3.20 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY ./ ./

RUN npm cache clean --force && \
    rm -rf /root/.npm

FROM node:20-alpine

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 3004

CMD ["node", "app.js"]
