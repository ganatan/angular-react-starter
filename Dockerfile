FROM nginx:1.17.1-alpine AS build
COPY . .
COPY nginx.conf /etc/nginx/nginx.conf
COPY /angular-react-starter/angular/dist/angular-starter/ /usr/share/nginx/html
RUN chown -R nginx:nginx /app && chmod -R 755 /app && \ 
        chown -R nginx:nginx /var/cache/nginx && \ 
        chown -R nginx:nginx /var/log/nginx && \ 
        chown -R nginx :nginx /etc/nginx/conf.d 
RUN touch /var/run/nginx.pid && \ 
        chown -R nginx:nginx /var/run/nginx.pid
