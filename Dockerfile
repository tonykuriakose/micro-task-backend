FROM node:23-alpine-slim AS builder

WORKDIR /app

COPY package/**.json ./

RUN npm install

COPY tsconfig.json ./

COPY src ./src

RUN npm run build


# Run

FROM node:23-alpine-slim

WORKDIR /app

COPY --from=builder /app/package.json ./
COPY --from=builder /app/dist ./dist    
RUN npm install --only=production
CMD [ "node","dist/shared/server.js" ]







