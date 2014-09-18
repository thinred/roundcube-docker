FROM    debian:stable
ENV     DEBIAN_FRONTEND noninteractive
MAINTAINER Round Cube <rc@xxx.org>

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends nginx php5-fpm nano wget php5-mcrypt php5-intl php5-sqlite sqlite3 procps

WORKDIR /root
# when roundcube grows older, change version in the download link, but also in the 'mv' command
RUN \
    wget http://freefr.dl.sourceforge.net/project/roundcubemail/roundcubemail/1.0.2/roundcubemail-1.0.2.tar.gz -O - | tar xz ;\
    rm -r /usr/share/nginx/www ;\
    mv /root/roundcubemail-1.0.2 /usr/share/nginx/www ;\
    rm -r /usr/share/nginx/www/installer ;\
    mkdir -p /rc
ADD config.inc.php /usr/share/nginx/www/config/
ADD default /etc/nginx/sites-enabled/default
ADD launch.sh /root/

VOLUME /rc
CMD [ "bash", "/root/launch.sh" ]
