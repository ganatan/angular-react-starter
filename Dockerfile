FROM nginx:1.22.0-alpine
WORKDIR /app
COPY /angular/dist/angular-starter/ /app
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/cache/nginx /var/run/nginx.pid /app
USER nginx
