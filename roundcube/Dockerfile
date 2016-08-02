FROM    debian:testing
ENV     DEBIAN_FRONTEND noninteractive
ENV     TERM xterm
MAINTAINER Round Cube <rc@xxx.org>

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends \
    ca-certificates nginx php7.0-fpm nano wget sqlite3 procps \
    php7.0-mcrypt php7.0-intl php7.0-sqlite3 php-pear \
    php-net-smtp php-mail-mime
WORKDIR /root
# when roundcube grows older, change version in the download link, but also in the 'mv' command
RUN \
    wget https://github.com/roundcube/roundcubemail/releases/download/1.2.1/roundcubemail-1.2.1-complete.tar.gz -O - | tar xz ;\
    rm -fr /usr/share/nginx/www ;\
    mv /root/roundcubemail-1.2.1 /usr/share/nginx/www ;\
    rm -fr /usr/share/nginx/www/installer ;\
    mkdir -p /rc
ADD config.inc.php /usr/share/nginx/www/config/
ADD default /etc/nginx/sites-enabled/default
ADD launch.sh /root/

VOLUME /rc
CMD [ "bash", "/root/launch.sh" ]
