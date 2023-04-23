FROM nginx:1.23.4

RUN apt-get update && apt-get install -y apache2-utils

COPY docker/nginx/etc/nginx /etc/nginx

EXPOSE 80