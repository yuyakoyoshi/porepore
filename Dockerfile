FROM ruby:2.6.7

ENV LANG C.UTF-8
ENV APP_ROOT /app

RUN apt-get update -qq && \
    apt-get install -y nodejs yarn

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

# bundle install
COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock
RUN bundle install 

COPY . $APP_ROOT

# script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]

