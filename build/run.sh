#!/bin/sh -e

#创建主目录文件夹和caddy配置目录
mkdir -p /var/www/html
mkdir -p /etc/caddy/

#创建Caddyfile
if [ ! -f /etc/caddy/Caddyfile ]; then
cat >  /etc/caddy/Caddyfile <<EOF
  :80 {
    root * /var/www/html
    php_fastcgi localhost:9000
    file_server
   }
EOF
fi


#启动php和caddy
php-fpm &

caddy run --config /etc/caddy/Caddyfile --adapter caddyfile

wait -n

exit $?