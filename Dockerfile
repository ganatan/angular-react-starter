# nginxinc/nginx-unprivileged:alpine3.20-perl
FROM nginx-unprivileged@sha256:b7757ba03fb5510a28c595387d765b2e715475e1c1ba23042e35288f62ed6b77

RUN adduser -D Nginx
USER Nginx

COPY ./angular/dist/angular-starter/nginx.conf /etc/nginx/nginx.conf
# COPY ./angular/dist/angular-starter/nginx.conf ./angular/nginx.conf
COPY ./angular/dist/angular-starter/ ./angular/dist/angular-starter/