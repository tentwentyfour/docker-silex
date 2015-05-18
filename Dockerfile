FROM docker.1024.lu/1024/apache-php
MAINTAINER Martin Simon <martin@tentwentyfour.lu>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y php5-mysqlnd php5-gd php5-curl php5-xdebug \
mysql-client php5-intl libxrender1 libxext6
RUN a2enmod rewrite

ADD silex.conf /etc/apache2/sites-available/
RUN a2dissite default
RUN a2ensite silex.conf

RUN echo xdebug.default_enable=1 >> /etc/php5/conf.d/20-xdebug.ini; \
	echo xdebug.remote_enable=1 >> /etc/php5/conf.d/20-xdebug.ini; \
	echo xdebug.remote_autostart=1 >> /etc/php5/conf.d/20-xdebug.ini; \
	echo xdebug.remote_connect_back=1 >> /etc/php5/conf.d/20-xdebug.ini; \
	echo xdebug.remote_port=9000 >> /etc/php5/conf.d/20-xdebug.ini

RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

ENV APACHE_ENV dev

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
