#Устанавливаем образ akpine версии 3.15.0
FROM alpine:3.15.0

#Устанавливаем необходимые пакеты (--no-cache не кешировать установочники. --update обновить список и версии пакетов)
RUN apk add --no-cache --update \
    nginx \
#curl проверка состояния контейнера
    curl \
#tini управление процессами
    tini \
#Создать каталог под логи
    && mkdir -p /logs \
#Удалить все дефолтные конфиги, логи, кэши и т.д.
    && rm -rf /tmp/* \
    /var/{cache,log}/* \
    /etc/logrotate.d \
    /etc/crontabs/* \
    /etc/periodic/daily/logrotate
    
#Выдаем права пользователя необходимым директориям
    RUN chown -R nginx:nginx /run \
    && chown -R nginx:nginx /var/lib \
    && chown -R nginx:nginx /var/log/nginx 
    
#Переключаемся на нашего пользователя
    USER nginx
    
#Порт, который принимает подключения
    EXPOSE 8080
    
#Точка входа. Команда, выполняемая при старте контейнера
    ENTRYPOINT ["/sbin/tini", "--"]
    
#Выполнаяемая по умолчанию команда. Запуск супервизора, который стартанет nginx + crontab
    CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

#Проверка nginx на работоспособность
    HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:8080/fpm-ping
