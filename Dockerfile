FROM nginx:1.21.1-alpine


RUN rm /etc/nginx/conf.d/default.conf
RUN chown -R nginx:nginx /etc/nginx/conf.d/
RUN chown -R nginx:nginx /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/
COPY dist /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
