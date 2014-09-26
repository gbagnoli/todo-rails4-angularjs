FROM rubyday/ruby:2.1

MAINTAINER Giacomo Bagnoli <gbagnoli@gmail.com>

RUN adduser todo --home /opt/todo --shell /bin/bash --disabled-password --gecos ""

RUN apt-get update && \
    apt-get install -y libpq-dev nodejs && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*.deb

ADD Gemfile /opt/todo/
ADD Gemfile.lock /opt/todo/
RUN chown -R todo:todo /opt/todo
RUN su -c "mkdir /opt/todo/bundle && bundle install --deployment --path /opt/todo/bundle" -s /bin/bash -l todo

WORKDIR /opt/todo
EXPOSE 3000
ADD . /opt/todo
RUN chown -R todo:todo /opt/todo

USER todo
ENTRYPOINT ["/bin/bash", "/opt/todo/bin/docker_entrypoint.sh"]
CMD ["bundle", "exec", "rails", "server"]
