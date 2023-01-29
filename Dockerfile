FROM nginx:1.17.1-alpine AS build
COPY . .
COPY nginx.conf /etc/nginx/nginx.conf
COPY /angular/dist/angular-starter /usr/share/nginx/html
