#!bin/sh
chown -R nginx:nginx /var/www/

mkdir /run/nginx/
mkdir /run/php/

# SSL
openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 -subj "/C=JP/ST=TOkyo/L=Minato-City/O=42Tokyo/OU=./CN=localhost" -keyout /etc/ssl/private/services.key -out /etc/ssl/certs/services.crt

# Setup telegraf.conf
telegraf config --input-filter cpu:mem --output-filter influxdb > /etc/telegraf.conf
sed -i -e 's|hostname = ""|hostname = "phpmyadmin"|g' /etc/telegraf.conf
sed -i -e 's|# urls = \["http://127.0.0.1:8086"\]|urls = \["http://influxdb-svc:8086"\]|g' /etc/telegraf.conf

# Start telegraf
telegraf --config /etc/telegraf.conf &

# Start php(make socket)
usr/sbin/php-fpm7;

# Start nginx
nginx -g 'daemon off;'
# killall -KILL php-fpm7;