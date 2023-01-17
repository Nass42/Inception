FROM alpine:3.16

RUN apk update && apk add redis

RUN sed -i 's/# maxmemory <bytes>/maxmemory 20mb/g' /etc/redis.conf && \
    echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf

EXPOSE 6379

CMD ["redis-server", "/etc/redis.conf"]