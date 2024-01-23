FROM ruby:3.1.1

RUN apt-get update -qq && apt-get install -y --no-install-recommends apt-utils \
  mariadb-server \
  ruby-railties \
  git-core \
  curl \
  build-essential \
  cmake \
  libssl-dev

ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN gem install bundler

COPY Gemfile Gemfile.lock $APP_HOME/

RUN bundle install

ADD . $APP_HOME
RUN cp $APP_HOME/config/database.example.yml $APP_HOME/config/database.yml

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
