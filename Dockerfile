# nginx:mainline-alpine3.20-slim
FROM nginx@sha256:e9293c9bedb0db866e7d2b69e58131db4c2478e6cd216cdd99b134830703983a

COPY ./angular/nginx.conf ./angular/nginx.conf
COPY ./angular/dist/angular-starter/ ./angular/dist/angular-starter/