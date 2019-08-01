FROM ruby:2.6.3

ENV BUNDLER_VERSION 2.0.2

RUN apt-get update && apt-get install -y build-essential nodejs libpq-dev postgresql-11 vim \
    && mkdir -p /app
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v $BUNDLER_VERSION --no-document -f \
    && bundle install --jobs 5 --retry 5

COPY . ./
