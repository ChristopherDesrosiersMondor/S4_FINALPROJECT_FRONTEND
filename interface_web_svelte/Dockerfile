# Dockerfile

FROM node:16-alpine

RUN npm install -g pnpm

WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN pnpm install
RUN npx prisma generate

COPY . .
RUN pnpm run build

EXPOSE 3000
CMD ["node", "build"]