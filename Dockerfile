FROM ruby:2.7.1

WORKDIR /delivery

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler && bundle install
RUN apt-get update -qq && apt-get install -y nodejs
RUN apt-get install -qq -y --no-install-recommends \
    apt-utils build-essential libpq-dev curl apt-transport-https imagemagick \
    libsqlite3-dev git

CMD ["rails", "server", "-b", "0.0.0.0"]