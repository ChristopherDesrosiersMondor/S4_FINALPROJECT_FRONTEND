FROM node:18-alpine AS build

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . ./
RUN npm prisma generate
RUN npm run dev

FROM nginx:1.19-alpine
COPY --from=build /app/public /usr/share/nginx/html