FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV production

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 expressjs

COPY package*.json ./
RUN npm ci --only=production

COPY --chown=expressjs:nodejs . .

USER expressjs

EXPOSE 3000

CMD ["node", "index.js"]
