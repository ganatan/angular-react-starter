FROM nginx:alpine
RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash
RUN rm /etc/nginx/conf.d/default.conf
RUN chown -R nginx:nginx /usr/share/nginx/html
RUN ls -la ./
RUN ls -la ../
RUN ls -la mnt
RUN ls -la home
RUN ls -la tmp
COPY ./nginx.conf /etc/nginx/conf.d/
COPY ./angular-starter/angular-starter/dist /usr/share/nginx/html

EXPOSE 8080
