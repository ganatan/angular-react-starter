#Устанавливаем образ akpine версии 3.15.0
FROM alpine:3.15.0

#Устанавливаем необходимые пакеты (--no-cache не кешировать установочники. --update обновить список и версии пакетов)
RUN apk add --no-cache --update \
    nginx \
#curl проверка состояния контейнера
    curl \
#tini управление процессами
    tini \
#Удалить все дефолтные конфиги, логи, кэши и т.д.
    && rm -rf /tmp/* \
    /var/{cache,log}/* \
    /usr/share/nginx/html/*
    
#Копируем конфиг nginx-а
    COPY ./nginx.conf /etc/nginx/nginx.conf 
    COPY dist/angular-starter /usr/share/nginx/html
    
#Выдаем права пользователя необходимым директориям
    RUN chown -R nginx:nginx /run \
    && chown -R nginx:nginx /var/lib \
    && chown -R nginx:nginx /var/log/nginx \
    && chown -R nginx:nginx /etc/nginx/conf.d \
    && chown -R nginx:nginx /usr/share/nginx/html
    
#Переключаемся на нашего пользователя
    USER nginx
    
#Порт, который принимает подключения
    EXPOSE 8080
    
#Точка входа. Команда, выполняемая при старте контейнера
    ENTRYPOINT ["/sbin/tini", "--"]

#Проверка nginx на работоспособность
    HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:8080/fpm-ping
