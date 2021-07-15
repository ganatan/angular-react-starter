FROM nginx:alpine
RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash
RUN rm /etc/nginx/conf.d/default.conf
RUN chown -R nginx:nginx /usr/share/nginx/html
RUN ls -la ./
COPY ./nginx.conf /etc/nginx/conf.d/
RUN npx ngcc --properties es2015 browser module main --create-ivy-entry-points
COPY ./angular-starter/angular-starter/dist /usr/share/nginx/html

EXPOSE 8080