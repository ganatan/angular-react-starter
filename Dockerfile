FROM nginx:1.17.1-alpine as dist
COPY . .
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=dist /usr/src/app/dist/ /usr/share/nginx/html
