FROM caddy:2-alpine AS builder

FROM php:8.1-fpm-alpine

LABEL maintainer="bioiy@126.com"

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY  gudou/gudou.php /var/www/html/
COPY  build/run.sh /

RUN chmod +x /run.sh && \
    apk --no-cache update && apk upgrade &&  \
    apk add --no-cache \
    curl \
    dumb-init

EXPOSE 80 9000

ENTRYPOINT ["dumb-init", "/run.sh"]
