FROM nginx:1.22.0-alpine
WORKDIR /app
COPY /angular/dist/angular-starter/ /app
USER nginx
