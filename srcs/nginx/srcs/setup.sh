#!bin/sh

# User settings
adduser -D -g 'www' www
chown -R www:www /var/lib/nginx
mkdir /var/www/html && chown -R www:www /var/www/html
mkdir /run/nginx/
chmod 777 /var/www/html/index.html

# Start nginx
nginx -g 'daemon off;'
