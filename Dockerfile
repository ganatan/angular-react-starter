FROM node:18-alpine AS build
WORKDIR /app
COPY angular/package*.json ./
RUN npm ci
COPY . .
WORKDIR /app/angular
RUN npm run build

FROM nginx:alpine
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/angular/dist/angular-starter/browser /usr/share/nginx/html
EXPOSE 80





