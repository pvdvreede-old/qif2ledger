FROM ruby:2.2
WORKDIR /app
RUN gem update bundler --no-rdoc --no-ri
