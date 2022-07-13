FROM nginx:alpine

RUN chown -R nginx:nginx /var/log/nginx \
    && chown -R nginx:nginx /etc/nginx/nginx.conf 
 
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
