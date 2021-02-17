#!bin/sh

## Install wordpress
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz -C /var/www/localhost/htdocs
rm -r latest.tar.gz

mkdir /run/nginx/
mkdir /run/php/

## Start php(make socket)
usr/sbin/php-fpm7;

## Start nginx
nginx -g 'daemon off;'
# killall -KILL php-fpm7;