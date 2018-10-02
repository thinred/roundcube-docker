FROM  ubuntu:18.04
LABEL maintainer="Michael Bushey <roundcube@sendthemtomir.com>"

RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list &&\
    apt-get update &&\
    apt-get -y upgrade &&\
    apt-get install -y --no-install-recommends \
      apt-transport-https ca-certificates nginx wget sqlite3 procps \
      php7.2-fpm php7.2-intl php7.2-sqlite3 \
      php-pear php-net-smtp php-mail-mime &&\
    rm -rf /var/lib/apt/lists/*

WORKDIR /root
ARG RC_VER=1.3.7
RUN rm -fr /usr/share/nginx/www &&\
    wget https://github.com/roundcube/roundcubemail/releases/download/${RC_VER}/roundcubemail-${RC_VER}-complete.tar.gz -O - | tar xz &&\
    mv /root/roundcubemail-${RC_VER} /usr/share/nginx/www &&\
    rm -fr /usr/share/nginx/www/installer &&\
    mkdir -p /rc
ADD config.inc.php /usr/share/nginx/www/config/
ADD default /etc/nginx/sites-enabled/default
ADD launch.sh /root/

EXPOSE 80
VOLUME /rc
CMD [ "bash", "/root/launch.sh" ]
