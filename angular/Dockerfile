#syntax=docker/dockerfile:1
# TODO: Write comments
FROM node:alpine as builder

RUN mkdir /app
WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .
# RUN npm run build --prod

FROM nginx:alpine

RUN  touch /var/run/nginx.pid && \
     chown -R nginx:nginx /var/cache/nginx /var/run/nginx.pid
RUN chown -R nginx:nginx /usr/share/nginx/html
RUN rm -rf /usr/share/nginx/html/*
USER nginx
# Create a new user and group
# RUN addgroup -S nginx && adduser -S nginx -G nginx

COPY --chown=nginx ./dist/angular-starter/browser/ /usr/share/nginx/html/
COPY --chown=nginx:nginx ./nginx.conf /etc/nginx/nginx.conf
# Change ownership of the html directory

# Switch to the new user
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
