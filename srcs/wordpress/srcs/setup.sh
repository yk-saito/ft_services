#!bin/sh
WP_PATH=/var/www/localhost/htdocs/wordpress/

# Install wordpress
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz -C /var/www/localhost/htdocs
rm -r latest.tar.gz

# Install WP-CLI
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

if ! $(wp core is-installed --path=$WP_PATH); 
then
    wp core install --path=$WP_PATH --url=https://localhost:5050/wordpress --title=ft_services --admin_user=admin42 --admin_password=admin42 --admin_email=admin@wordpress.com --skip-email
    wp user create --path=$WP_PATH user1 editor@wordpress.com --role=editor --user_pass=edirot
    wp user create --path=$WP_PATH user2 author@wordpress.com --role=author --user_pass=author
fi

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