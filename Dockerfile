# nginx:mainline-alpine3.20-slim
FROM nginx@sha256:e9293c9bedb0db866e7d2b69e58131db4c2478e6cd216cdd99b134830703983a AS nginx-ang

COPY ./angular/nginx.conf /etc/nginx/nginx.conf
COPY ./angular/dist/angular-starter /var/www/html

RUN chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid

USER nginx