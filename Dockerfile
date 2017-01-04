FROM docker.1024.lu/1024/apache-php:7.0
MAINTAINER Martin Simon <martin@tentwentyfour.lu>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y php-curl php-xdebug php-soap \
 mysql-client php-intl libxrender1 libxext6
RUN apt-get install -y libxrender-dev libxext-dev
RUN a2enmod rewrite

ADD app.conf /etc/apache2/sites-available/
RUN a2dissite 000-default.conf
RUN a2ensite app.conf

RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/
