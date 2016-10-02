FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /killboard
WORKDIR /killboard
ADD Gemfile /killboard/Gemfile
ADD Gemfile.lock /killboard/Gemfile.lock
RUN bundle install -j4
ADD . /killboard
