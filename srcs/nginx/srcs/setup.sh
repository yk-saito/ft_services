#!bin/sh

# User settings
mkdir /run/nginx/
chmod 755 /var/www/index.html

# SSL
openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 -subj "/C=JP/ST=TOkyo/L=Minato-City/O=42Tokyo/OU=./CN=localhost" -keyout /etc/ssl/private/services.key -out /etc/ssl/certs/services.crt

# Start telegraf
telegraf &

# Start SSH
/usr/sbin/sshd

# Start nginx
nginx -g 'daemon off;'
