FROM alpine:3.16.2

RUN apk add -U nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY ./angular/dist/angular-starter/ /usr/share/nginx/html/

RUN cd /tmp && ls -lah
RUN mkdir -p /tmp/client_body \

	&& ls -lah /tmp \
	&& ls -lah /var/run \
	&& ls -lah /var/lib \
	&& ls -lah /var/log/nginx \
	&& ls -lah /usr/share/nginx
	
USER nginx

EXPOSE 8080

CMD ["nginx -c /etc/nginx/nginx.conf"] 

