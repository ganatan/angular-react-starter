FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/ &&\
     dist/angular-starter /usr/share/nginx/html/

RUN chown -R nginx:nginx /etc/nginx/conf.d/ &&\
    chown -R nginx:nginx /usr/share/nginx/html/ &&\
    rm /etc/nginx/conf.d/default.conf
     

EXPOSE 8080

ENTRYPOINT ["nginx", "-g", "daemon off;"]
