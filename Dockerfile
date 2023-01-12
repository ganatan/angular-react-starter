FROM alpine:3.17.0
RUN apk add nginx
EXPOSE 80
RUN apk add angular-starter
