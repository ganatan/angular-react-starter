FROM alpine:latest as build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN apk add --update npm
RUN npm install
COPY . .
RUN npm run 
FROM nginx:latest
COPY react/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/angular/dist/angular-starter /usr/share/nginx/html