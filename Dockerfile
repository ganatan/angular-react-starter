FROM node:alpine as builder
WORKDIR /app
COPY ./angular/package.json ./angular/package-lock.json ./
ENV CI=1
RUN npm ci

COPY ./angular .
RUN npm run build -- --configuration production --output-path=/dist

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/
RUN  chown -R nginx:nginx /var/cache/nginx && \
     chown -R nginx:nginx /var/log/nginx && \
     chown -R nginx:nginx /etc/nginx/conf.d && \
     chown -R nginx:nginx /etc/nginx/
USER nginx
EXPOSE 8080
ENTRYPOINT ["nginx", "-g", "daemon off;"]