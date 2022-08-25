FROM alpine:3.16.2

RUN apk add -U nginx yarn
COPY nginx.conf /etc/nginx/nginx.conf
CMD ["nginx"] 
