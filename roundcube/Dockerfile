FROM    debian:testing
ENV     DEBIAN_FRONTEND noninteractive
ENV     TERM xterm
MAINTAINER MAINTAINER Michael Bushey <roundcube@sendthemtomir.com>

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends \
    ca-certificates nginx wget sqlite3 procps \
    php7.0-fpm php7.0-mcrypt php7.0-intl php7.0-sqlite3 \
    php-pear php-net-smtp php-mail-mime
WORKDIR /root

ARG RC_VER=1.3.1
RUN rm -fr /usr/share/nginx/www &&\
    wget https://github.com/roundcube/roundcubemail/releases/download/${RC_VER}/roundcubemail-${RC_VER}-complete.tar.gz -O - | tar xz &&\
    mv /root/roundcubemail-${RC_VER} /usr/share/nginx/www &&\
    rm -fr /usr/share/nginx/www/installer &&\
    mkdir -p /rc
ADD config.inc.php /usr/share/nginx/www/config/
ADD default /etc/nginx/sites-enabled/default
ADD launch.sh /root/

VOLUME /rc
CMD [ "bash", "/root/launch.sh" ]
