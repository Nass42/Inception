FROM alpine:latest

RUN apk update && apk add --no-cache grafana
COPY requirements/bonus/grafana/conf/grafana.ini /etc/grafana/grafana.ini
COPY requirements/bonus/grafana/conf/script.sh /tmp
RUN chmod +x /tmp/script.sh && \
    sh /tmp/script.sh
EXPOSE 3000

CMD ["grafana-server", "--config", "/etc/grafana/grafana.ini", "--homepath", "/usr/share/grafana"]
