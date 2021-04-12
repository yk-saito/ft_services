#!bin/sh
WP_PATH=/var/www/wordpress/

wp core download --path=$WP_PATH --locale=ja
wp config create --path=$WP_PATH --dbname=wordpress_db --dbuser=admin42 --dbpass=admin42 --dbhost=mysql-svc -dbcharset=utf8mb4
wp db create
wp core install --path=$WP_PATH --url=https://192.168.49.2:5050/wordpress --title=ft_services --admin_user=admin42 --admin_password=admin42 --admin_email=admin@wordpress.com --skip-email
wp user create --path=$WP_PATH user1 editor@wordpress.com --role=editor --user_pass=edirot
wp user create --path=$WP_PATH user2 author@wordpress.com --role=author --user_pass=author

chown -R nginx:nginx /var/www/wordpress/

mkdir /run/nginx/
mkdir /run/php/

#SSL
openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 -subj "/C=JP/ST=TOkyo/L=Minato-City/O=42Tokyo/OU=./CN=localhost" -keyout /etc/ssl/private/services.key -out /etc/ssl/certs/services.crt

# Start telegraf
telegraf &

# Start php(make socket)
usr/sbin/php-fpm7;

# Start nginx
nginx -g 'daemon off;'
# killall -KILL php-fpm7;