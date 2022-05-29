#!/bin/sh
htpasswd -bc /etc/nginx/.htpasswd $AUTH_BASIC_USERNAME $AUTH_BASIC_PASSWORD
exec nginx -g 'daemon off;'