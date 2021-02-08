FROM alpine:latest

RUN apk update && \
    apk add mysql mysql-client
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN mysql -e "CREATE DATABASE wordpress";
RUN mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'wordpress';"

#start mysql daemon
ENTRYPOINT [ "/usr/bin/mysqld_safe" ]
CMD [ "--datadir=/var/lib/mysql" ]