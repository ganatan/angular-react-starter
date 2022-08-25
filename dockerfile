FROM alpine:3.16.2

RUN apk add -U nginx yarn
COPY nginx.conf /etc/nginx/nginx.conf

RUN cd ./angular/dist/angular-starter
COPY *.json /usr/share/nginx/html/
COPY *.js /usr/share/nginx/html/
COPY src /usr/share/nginx/html/
COPY img /usr/share/nginx/html/img/
CMD ["nginx"] 
