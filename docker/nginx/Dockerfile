FROM nginx:1.25.3

RUN apt-get update && apt-get install -y apache2-utils

COPY docker/nginx/etc/nginx /etc/nginx

EXPOSE 80