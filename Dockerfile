#Устанавливаем образ akpine версии 3.15.0
FROM alpine:3.15.0

#Устанавливаем необходимые пакеты (--no-cache не кешировать установочники. --update обновить список и версии пакетов)
RUN apk add --no-cache --update \
    nginx \
#curl проверка состояния контейнера
    curl \
#tzdata поддержка часовых поясов 
    tzdata \
#tini управление процессами
    tini \
#supervisor Запуск процессов под управлением одного процесса
    supervisor \
#Логи
    logrotate \
#Облегченный крон
    dcron \
#Запуск крона пользователями без админки
    libcap \
#chown назначаем пользователя владельцем файла. Разрешаем запускать файл crond пользователям с использованием рут прав, изменив setid
    && chown myuser:myuser /usr/sbin/crond \
    && setcap cap_setgid=ep /usr/sbin/crond \
#Создать каталог под логи
    && mkdir -p /logs \
#Удалить все дефолтные конфиги, логи, кэши и т.д.
    && rm -rf /tmp/* \
    /var/{cache,log}/* \
    /etc/logrotate.d \
    /etc/crontabs/* \
    /etc/periodic/daily/logrotate
    
#Копируем содержимое roots в корень образа
    COPY roots /
    
#Выдаем права пользователя необходимым директориям
    RUN chown -R myuser:myuser /logs \
    && chown -R myuser:myuser /run \
    && chown -R myuser:myuser /var/lib \
    && chown -R myuser:myuser /var/log/nginx \
    && chown -R nobody:nobody /etc/crontabs 
    
#Переключаемся на нашего пользователя
    USER myuser
    
#Делаем каталог /roots корневым каталогом контейнера
    WORKDIR /roots
    
#Порт, который поринимает подключения
    EXPOSE 8080
    
#Точка входа. Команда, выполняемая при старте контейнера
    ENTRYPOINT ["/sbin/tini", "--"]
    
#Выполнаяемая по умолчанию команда. Запуск супервизора, который стартанет nginx + crontab
    CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
