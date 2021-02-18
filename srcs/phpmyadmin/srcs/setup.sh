#!bin/sh

## Install phpmyadmin
mkdir -p /var/www/localhost/htdocs/phpmyadmin;
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz;
tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz\
	--strip-components=1 -C /var/www/localhost/htdocs/phpmyadmin/;
rm -r phpMyAdmin-5.0.4-all-languages.tar.gz;

mkdir /run/nginx/
mkdir /run/php/

## Start php(make socket)
usr/sbin/php-fpm7;

## Start nginx
nginx -g 'daemon off;'
# killall -KILL php-fpm7;