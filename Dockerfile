FROM node:latest

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

RUN rm -rf node_modules

EXPOSE 5000

CMD ["node", "dist/app.js"]