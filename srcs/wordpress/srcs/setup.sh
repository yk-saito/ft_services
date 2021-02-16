#!bin/sh

# Install wordpress
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz -C /var/www/localhost/htdocs
rm -r latest.tar.gz

mkdir /run/php/
usr/sbin/php-fpm7;
# killall -KILL php-fpm7;