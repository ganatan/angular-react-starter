FROM nginx:1.17.1-alpine as di
COPY . .
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=di /home/runner/work/angular-react-starter/angular-react-starter/ /usr/share/nginx/html
