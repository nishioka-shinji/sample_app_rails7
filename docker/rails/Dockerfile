FROM ruby:3.1.2-slim

RUN apt-get update && \
    apt-get install -y gcc \
                       g++ \
                       make \
                       default-libmysqlclient-dev

RUN mkdir /sample_app_rails7
WORKDIR /sample_app_rails7
COPY Gemfile /sample_app_rails7/Gemfile
COPY Gemfile.lock /sample_app_rails7/Gemfile.lock
RUN gem install bundler -v '2.3.14'
RUN bundle install
COPY . /sample_app_rails7

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]