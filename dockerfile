FROM alpine:3.16.2

RUN apk add -U nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./angular/dist/angular-starter/ /usr/share/nginx/html/

RUN ls -lh /tmp
RUN mkdir -p /tmp/client_body \
	&& chown -R nginx:nginx /var/run \
	&& chown -R nginx:nginx /var/lib \
	&& chown -R nginx:nginx /var/log/nginx \
	&& chown -R nginx:nginx /etc/nginx/nginx.conf \
	&& chown -R nginx:nginx /usr/share/nginx/html \
	&& chown -R nginx:nginx /tmp/client_body \
	&& chown -R nginx:nginx /tmp/fastcgi_temp \
	&& chown -R nginx:nginx /tmp/proxy_temp \
	&& chown -R nginx:nginx /tmp/scgi_temp \
	&& chown -R nginx:nginx /tmp/uwsgi_temp
 
USER nginx

EXPOSE 8080

CMD ["nginx -c /etc/nginx/nginx.conf"] 
