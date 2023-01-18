FROM nginx:1.17.1-alpine AS build
COPY . .
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /home/runner/work/angular-react-starter/angular-react-starter /usr/share/nginx/html
