FROM ubuntu:xenial

MAINTAINER Mike H.

RUN apt-get update

RUN apt-get install -y curl \
                       redis-tools \
                       make \
                       gcc \
                       apache2 \
                       apache2-dev \
                       git

RUN cd /
RUN git clone https://github.com/sneakybeaky/mod_redis.git mod_redis_source

WORKDIR /mod_redis_source
RUN git clone https://github.com/redis/hiredis.git /mod_redis_source/hiredis

ENV HIREDIS_HOME=/mod_redis_source/hiredis

ADD ./files/etc/apache2/redis_test.conf /etc/apache2/sites-available/000-default.conf
ADD ./files/install.sh /mod_redis_source/install.sh

RUN chown -R root:root install.sh
RUN chmod -R 664 install.sh

#RUN sh install.sh