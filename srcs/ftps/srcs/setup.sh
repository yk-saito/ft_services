#!bin/sh

# SSL
openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 -subj "/C=JP/ST=TOkyo/L=Minato-City/O=42Tokyo/OU=./CN=localhost" -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt

# Start telegraf
telegraf --config /etc/telegraf.conf &

# Start ftps
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf