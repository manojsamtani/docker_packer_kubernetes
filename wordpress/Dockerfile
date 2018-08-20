FROM ubuntu:14.04

ENV DB_NAME=wordpress \
    DB_PORT=3306 \
    DB_HOST=localhost \
    DB_USER=root \
    DB_PASS=root

ENV DEBIAN_FRONTEND=noninteractive

# Avoid ERROR: invoke-rc.d: policy-rc.d denied execution of start.
RUN sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d

RUN apt-get update && apt-get -y install \
    apache2 \
    php5 \
    php5-mysql \
    supervisor \
    wget

RUN echo 'mysql-server mysql-server/root_password password root' | \
#    echo 'debconf debconf/frontend select Noninteractive' | \
    debconf-set-selections && \
    echo 'mysql-server mysql-server/root_password_again password root' | \
#    echo 'debconf debconf/frontend select Noninteractive' | \
    debconf-set-selections

RUN apt-get install -qqy mysql-server

RUN wget http://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    cp -R ./wordpress/* /var/www/html && \
    rm /var/www/html/index.html

RUN (/usr/bin/mysqld_safe &); sleep 5; mysqladmin -u root -proot create wordpress

COPY wp-config.php /var/www/html/wp-config.php
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80
CMD ["/usr/bin/supervisord"]
