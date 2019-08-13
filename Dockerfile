FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim

RUN mkdir /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler -v 2.0.2 --no-document
WORKDIR /app
RUN bundle install --jobs 5 --retry 5

COPY . /app

EXPOSE 3000
