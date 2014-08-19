FROM 1024/php5
MAINTAINER David Raison david@tentwentyfour.lu

RUN apt-get install -y mysql-client 

ADD run.sh /run.sh
RUN chmod 755 /run.sh

ADD default.vhost /etc/apache2/sites-enabled/default

CMD ["/run.sh"]