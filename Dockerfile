FROM nginx:1.17.1-alpine AS build
COPY . .
COPY nginx.conf /etc/nginx/nginx.conf
COPY /usr/src/app/dist/angular /usr/share/nginx/html
