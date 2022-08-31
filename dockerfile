FROM alpine:3.16.2

RUN apk add -U nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY ./angular/dist/angular-starter/ /usr/share/nginx/html/

RUN mkdir -p /var/log/nginx \
	/var/cache/nginx && \
	touch /var/run/nginx.pid

RUN chown -R nginx:nginx /var/run && \
	chown -R nginx:nginx /var/cache/nginx && \
	chown -R nginx:nginx /var/log/nginx && \
	chown -R nginx:nginx /etc/nginx/nginx.conf && \
	chown -R nginx:nginx /var/lib && \
	chown -R nginx:nginx /usr/share/nginx/html
	
		
USER nginx

EXPOSE 8080

CMD ["nginx", "-c", "/etc/nginx/nginx.conf", "-p", "8080:8080"] 

