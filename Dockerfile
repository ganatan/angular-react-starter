FROM node:alpine as builder

WORKDIR /app
COPY ./angular/package.json ./angular/package-lock.json ./
ENV CI=1
RUN npm ci

COPY ./angular .
RUN npm run build -- --configuration production --output-path=/dist

# 2. Deploy our Angular app to NGINX
FROM nginx:alpine

## Replace the default nginx index page with our Angular app
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /dist /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]