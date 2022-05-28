FROM ruby:3.1.2

RUN mkdir /sample_app_rails7
WORKDIR /sample_app_rails7
COPY Gemfile /sample_app_rails7/Gemfile
COPY Gemfile.lock /sample_app_rails7/Gemfile.lock
RUN bundle install
COPY . /sample_app_rails7

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]