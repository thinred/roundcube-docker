FROM    debian:testing
ENV     DEBIAN_FRONTEND noninteractive
ENV     TERM xterm
MAINTAINER MAINTAINER Michael Bushey <roundcube@sendthemtomir.com>

RUN apt-get -y update &&\
    apt-get -y upgrade &&\
    apt-get install -y --no-install-recommends \
    apt-transport-https ca-certificates \
    nginx wget sqlite3 procps &&\
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg &&\
    sh -c 'echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list' &&\
    apt-get -y update &&\
    apt-get install -y --no-install-recommends \
    php7.1-fpm php7.1-mcrypt php7.1-intl php7.1-sqlite3 \
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
