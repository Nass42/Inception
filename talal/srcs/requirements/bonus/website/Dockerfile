FROM alpine:3.16
RUN	apk update && apk upgrade && apk add --no-cache nginx
COPY /requirements/bonus/website/tools/. /var/www/public/
EXPOSE 8090
CMD ["nginx", "-g", "daemon off;"]