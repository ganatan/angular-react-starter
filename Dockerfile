FROM nginx:alpine

COPY /angular/dist/angular-starter /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080