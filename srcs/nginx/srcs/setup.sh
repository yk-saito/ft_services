#!bin/sh

# User settings
mkdir /run/nginx/
chmod 755 /var/www/localhost/htdocs/index.html

# Start nginx
nginx -g 'daemon off;'
