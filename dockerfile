FROM alpine:3.16.2

RUN apk add -U nginx

RUN mkdir -p /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
COPY ./angular/dist/angular-starter/ /usr/share/nginx/html/

RUN chown -R nginx:nginx /etc/nginx/nginx.conf \
&& chown -R nginx:nginx /usr/sbin \
&& chown -R nginx:nginx /var/run \
&& chown -R nginx:nginx /var/lib \
&& chown -R nginx:nginx /usr/share/nginx

USER nginx

EXPOSE 8080

CMD ["nginx", "-c", "/etc/nginx/nginx.conf"]
