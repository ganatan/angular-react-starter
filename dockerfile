FROM alpine:3.16.2

RUN echo "bebebesbababa"

RUN apk add -U nginx

RUN echo "bebebesbababa"

COPY nginx.conf /etc/nginx/nginx.conf

COPY ./angular/dist/angular-starter/ /usr/share/nginx/html/

RUN mkdir -p /tmp/client_body \
	/tmp/fastcgi_temp \
	/tmp/fastcgi_temp \
	/tmp/scgi_temp \
	/tmp/uwsgi_temp \
	&& chown -R nginx:nginx /etc/nginx/nginx.conf \
	&& chown -R nginx:nginx /var/run \
	&& chown -R nginx:nginx /var/lib \
	&& chown -R nginx:nginx /usr/share/nginx/html
	
USER nginx

EXPOSE 8080

CMD ["nginx", "-c", "/etc/nginx/nginx.conf", "-p", "8080:8080"] 

