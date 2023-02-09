FROM ruby:3.2.1-alpine3.16

RUN mkdir /sample_app_rails7
WORKDIR /sample_app_rails7

COPY Gemfile /sample_app_rails7/Gemfile
COPY Gemfile.lock /sample_app_rails7/Gemfile.lock
COPY . /sample_app_rails7


RUN apk update && \
    apk add --no-cache \
        gcc \
        g++ \
        make \
        libxml2-dev \
        libxslt-dev \
        mariadb-dev \
        gcompat \
        tzdata && \
    gem install bundler -v '2.3.14' && \
    bundle install && \
    rm -rf /usr/local/bundle/cache/* /usr/local/share/.cache/* /var/cache/* /tmp/* && \
    apk del gcc g++ make libxml2-dev libxslt-dev
# gcc, g++, make for bundle install
# libxml2-dev, libxslt-dev for install gem nokogiri
# mariadb-dev for use gem mysql2
# gcompat for use gem nokogiri
# tzdata for use gem tzinfo-data

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

RUN rm -rf /sample_app_rails7/tmp/sockets && \
    mkdir /sample_app_rails7/tmp/sockets
VOLUME ["/sample_app_rails7/tmp/sockets"]
VOLUME ["/sample_app_rails7/public"]
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000