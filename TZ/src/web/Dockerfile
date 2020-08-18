FROM alpine:3.12
MAINTAINER Greem Whats


RUN apk update && apk upgrade \
    &&  apk add  --no-cache nginx php7-fpm supervisor && mkdir -p /run/nginx \
    &&  adduser -D -g 'www' www && mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www \
    &&  mkdir -p /etc/supervisord.d

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.php /www/index.php
# COPY supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# COPY supervisor/nginx.conf /etc/supervisor/conf.d/nginx.conf
# COPY supervisor/php-fpm.conf /etc/supervisor/conf.d/php-fpm.conf

#supervisord basic config file
RUN echo  $'[supervisord] \n\
[unix_http_server] \n\
file = /tmp/supervisor.sock \n\
chmod = 0777 \n\
chown= nobody:nogroup \n\
[supervisord] \n\
logfile = /tmp/supervisord.log \n\
logfile_maxbytes = 50MB \n\
logfile_backups=10 \n\
loglevel = info \n\
pidfile = /tmp/supervisord.pid \n\
nodaemon = true \n\
umask = 022 \n\
identifier = supervisor \n\
[supervisorctl] \n\
serverurl = unix:///tmp/supervisor.sock \n\
[rpcinterface:supervisor] \n\
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface \n\
[include] \n\
files = /etc/supervisord.d/*.conf' >> /etc/supervisord.conf && \
# nginx supervisord Config
echo $'[supervisord] \n\
nodaemon=true \n\
[program:nginx] \n\
command= /usr/sbin/nginx -g \'daemon off;\' \n\
stdout_logfile=/dev/fd/1 \n\
stdout_logfile_maxbytes=0MB \n\
stderr_logfile_maxbytes = 0 \n\
stderr_logfile=/dev/fd/2 \n\
redirect_stderr=true \n\
autorestart=false \n\
startretries=0 \n\
exitcodes=0 ' >> /etc/supervisord.d/nginx.conf && \
# php-fpm7
echo $'[supervisord] \n\
nodaemon=true \n\
[program:php-fpm] \n\
command= /usr/sbin/php-fpm7  -F \n\
stdout_logfile=/dev/fd/1 \n\
stdout_logfile_maxbytes=0MB \n\
stderr_logfile_maxbytes = 0 \n\
stderr_logfile=/dev/fd/2 \n\
redirect_stderr=true \n\
autorestart=false \n\
startretries=0 \n\
exitcodes=0 ' >> /etc/supervisord.d/php-fpm.conf

# ENTRYPOINT ["su-exec", "nobody", "/usr/sbin/php-fpm7", "--nodaemonize", "--force-stderr"]
# CMD ["nginx", "-g", "daemon off;"]

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
