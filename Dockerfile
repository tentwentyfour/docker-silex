FROM 1024/php5
MAINTAINER David Raison david@tentwentyfour.lu

RUN apt-get update
RUN apt-get install -y mysql-client git nodejs nodejs-legacy npm
RUN npm install -g grunt grunt-cli

ADD run.sh /run.sh
RUN chmod 755 /run.sh

ADD default.vhost /etc/apache2/sites-enabled/default

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD ["/run.sh"]