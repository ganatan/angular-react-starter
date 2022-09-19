# FROM node:alpine as builder

# WORKDIR /app

# COPY ./angular/package.json ./angular/package-lock.json ./
# ENV CI=1
# RUN npm ci

# COPY ./angular .
# RUN npm run build -- --configuration production --output-path=/dist

# # 2. Deploy our Angular app to NGINX
# FROM nginx:alpine
# WORKDIR /app
# RUN rm -rf /usr/share/nginx/html/*
# ## Replace the default nginx index page with our Angular app
# COPY --from=builder /dist /usr/share/nginx/html

# COPY ./nginx.conf /etc/nginx/nginx.conf

# ENTRYPOINT ["nginx", "-g", "daemon off;"]

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
# USER nginx
# Use root user to copy dist folder and modify user access to specific folder
# COPY ./nginx.conf /etc/nginx/nginx.conf
# RUN rm -rf /etc/nginx/html/*
USER nginx
EXPOSE 8080
ENTRYPOINT ["nginx", "-g", "daemon off;"]