FROM       ubuntu:14.04

MAINTAINER Giacomo Bagnoli <gbagnoli@gmail.com>
RUN echo "deb http://ppa.launchpad.net/brightbox/ruby-ng-experimental/ubuntu trusty main" \
    > /etc/apt/sources.list.d/ruby-ng.list

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C3173AA6

RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y ruby2.1 ruby2.1-dev && \
    update-alternatives --set ruby /usr/bin/ruby2.1 && \
    update-alternatives --set gem /usr/bin/gem2.1 && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*.deb
RUN gem install bundle
