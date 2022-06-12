# For build inside the docker uncomment underlines

# FROM node:latest as build
# WORKDIR /app
# COPY angular/ /app/
# RUN npm install
# RUN npm run build

FROM nginx:alpine

# For build inside the docker uncomment underline

# COPY --from=build /app/dist/angular-starter /usr/share/nginx/html

COPY /angular/dist/angular-starter /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080
ENTRYPOINT ["nginx", "-g", "daemon off;"]
