FROM alpine:latest

RUN apk update && \
    apk add mysql mysql-client

<<<<<<< HEAD
COPY ./srcs/my.cnf /etc/
COPY ./srcs/setup.sh ./srcs/init.sql /tmp/

RUN mkdir -p /run/mysqld

# MySQL init datadir and make system table
RUN mysql_install_db

EXPOSE 3306
=======
RUN mysql -e "CREATE DATABASE wordpress"; \
    mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'wordpress';"
>>>>>>> 76a672d38a234fc981769781431202efb5440011

#start mysql daemon
CMD [ "/usr/bin/mysqld" ]

#CMD ["/tmp/setup.sh"]