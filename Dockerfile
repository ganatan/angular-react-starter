FROM node:14-alpine AS build
WORKDIR /usr/local/app
COPY ./ /usr/local/app/
RUN npm install
RUN npm run build

### STAGE 2: Setup ###
FROM nginx:alpine

COPY ./nginx.conf /etc/nginx/conf.d/
RUN rm /etc/nginx/conf.d/default.conf
RUN chown -R nginx:nginx /usr/share/nginx/html
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /usr/local/app/dist/angular-starter /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 8080
