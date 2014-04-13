
FROM    debian:wheezy
ENV     DEBIAN_FRONTEND noninteractive
MAINTAINER Round Cube <rc@xxx.org>

VOLUME [ "/rc" ]

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends nginx php5-fpm nano wget php5-mcrypt php5-intl php5-sqlite sqlite3 procps

WORKDIR /root
RUN wget http://tinyurl.com/neaqzan -O rc.tar.gz
RUN tar xf rc.tar.gz
RUN rm -r /usr/share/nginx/www
RUN mv /root/roundcubemail-1.0.0 /usr/share/nginx/www
RUN rm -r /usr/share/nginx/www/installer
ADD config.inc.php /usr/share/nginx/www/config/
ADD default /etc/nginx/sites-enabled/default
ADD launch.sh /root/

CMD [ "bash", "/root/launch.sh" ]
