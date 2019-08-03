FROM ruby:2.6.3

RUN apt-get update && apt-get install -y build-essential nodejs libpq-dev postgresql-11 vim \
    && mkdir -p /app

COPY . /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.0.2 --no-document -f \
    && bundle install --jobs 3 --retry 5
