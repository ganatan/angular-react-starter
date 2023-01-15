FROM nginx:1.23.2-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY /dist/aston-villa-app /usr/share/nginx/html
