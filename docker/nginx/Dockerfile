FROM nginx:1.21.6

RUN apt-get update && apt-get install -y apache2-utils

COPY ./docker/nginx/etc/nginx /etc/nginx
COPY ./docker/nginx/tmp/bin /tmp/bin

EXPOSE 80
ENTRYPOINT ["/tmp/bin/start.sh"]