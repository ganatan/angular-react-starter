FROM nginx:alpine
RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash
RUN rm /etc/nginx/conf.d/default.conf
RUN chown -R nginx:nginx /var/lib/nginx
RUN chown -R nginx:nginx /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/
COPY --from=build ./dist/angular-starter /usr/share/nginx/html

EXPOSE 8080
