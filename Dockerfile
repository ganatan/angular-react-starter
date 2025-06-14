#STAGE_BUILD
FROM node:17-alpine as build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install 
COPY . /app                  
RUN npm run build

#STAGE_SERVER
FROM nginx:1.21.6-alpine as server
LABEL maintainer="Aleksandr Sham" 
LABEL version="1.0"
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist/angular-starter /usr/share/nginx/html
# add permissions for nginx user
RUN chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d && \
    chown -R nginx:nginx /etc/nginx/nginx.conf && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid
# switch to non-root user
USER nginx