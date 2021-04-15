#!bin/sh
WP_PATH=/var/www/wordpress/

mysqladmin ping -h mysql-svc --silent
while [ $? = 1 ]
do
    echo "Waiting mysql service setup..."
    sleep 10
    mysqladmin ping -h mysql-svc --silent
done

if ! $(wp core is-installed); then
    wp config create --path=$WP_PATH --dbname=wordpress_db --dbuser=admin42 --dbpass=admin42 --dbhost=mysql-svc
    wp core install --path=$WP_PATH --url=https://192.168.49.2:5050 --title=ft_services --admin_user=admin42 --admin_password=admin42 --admin_email=admin@example.com --skip-email
    wp user create --path=$WP_PATH user1 editor@example.com --role=editor --user_pass=edirot
    wp user create --path=$WP_PATH user2 author@example.com --role=author --user_pass=author
fi

mkdir /run/nginx/
mkdir /run/php/

#SSL
openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 -subj "/C=JP/ST=TOkyo/L=Minato-City/O=42Tokyo/OU=./CN=localhost" -keyout /etc/ssl/private/services.key -out /etc/ssl/certs/services.crt

# Setup telegraf.conf
telegraf config --input-filter cpu:mem --output-filter influxdb > /etc/telegraf.conf
sed -i -e 's|hostname = ""|hostname = "wordpress"|g' /etc/telegraf.conf
sed -i -e 's|# urls = \["http://127.0.0.1:8086"\]|urls = \["http://influxdb-svc:8086"\]|g' /etc/telegraf.conf

# Start telegraf
telegraf --config /etc/telegraf.conf &

# Start php(make socket)
usr/sbin/php-fpm7;

# Start nginx
nginx -g 'daemon off;'
# killall -KILL php-fpm7;

# memo
#mkdir /run/php/
#vi /etc/php7/php-fpm.d/www.conf
#usr/sbin/php-fpm7;
#killall -KILL php-fpm7;