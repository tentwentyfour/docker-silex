FROM ttf/php5
MAINTAINER David Raison david@tentwentyfour.lu

RUN apt-get install -y mysql-client 

ADD run.sh /run.sh
RUN chmod 755 /run.sh

CMD ["/run.sh"]