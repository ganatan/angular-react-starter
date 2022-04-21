#STAGE_BUILD
FROM node:17-alpine as build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install 
COPY . /app                  
RUN npm run build

#STAGE_SERVER
FROM nginx:1.21.6-alpine as server
LABEL maintainer="Aleksandr Sham" 
LABEL version="1.0"
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist/angular-starter /usr/share/nginx/html