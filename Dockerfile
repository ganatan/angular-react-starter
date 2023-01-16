FROM node:12.7-alpine AS build
WORKDIR 
COPY . .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/sample-app /usr/share/nginx/html
