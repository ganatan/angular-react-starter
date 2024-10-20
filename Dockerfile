# Specifying exact version that I have one my pc as it runs
# https://hub.docker.com/layers/library/node/20.15.0-alpine/images/sha256-89656a128d997717c1e97f9ee32f82274f332f1c6b70a30698cf9afc5ae46ad9

# ✍️ Resources
# https://medium.com/@bidyutnayak10/running-angular-apps-with-nginx-in-docker-anywhere-a-simple-guide-3e951b22f86f
# https://dev.to/oneofthedevs/docker-angular-nginx-37e4


# ⭐ Serving the angular build on nginx server
FROM nginx:alpine

# remove default nginx website
RUN rm -rf /usr/share/nginx/html/*
# Copying dist without node_modules
COPY ./angular/dist/angular-starter/browser/ /usr/share/nginx/html

# Removing default nginx config and adding custom one
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf  /etc/nginx/conf.d/default.conf

# Default port
EXPOSE 80

# Got from https://medium.com/kocsistem/how-to-run-nginx-for-root-non-root-5ceb13db6d41 "What if we want to run NGINX as non-root user?"
RUN chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid

USER nginx

# To check if nginx is running from non-root user
# docker compose up -d
# docker exec -it <container_id> /bin/sh
# RUN ps aux 

# This command runs in docker-compose.yml so container doesn't stop
CMD ["nginx", "-g", "daemon off;"]
