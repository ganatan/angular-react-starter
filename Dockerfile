FROM nginx:1.23.2-alpine
COPY --from=builder /app/dist/<name of your app>/* /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
