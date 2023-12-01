FROM ruby:3.2-alpine
RUN gem install bundler
COPY Gemfile /home/app/Gemfile
COPY Gemfile.lock /home/app/Gemfile.lock
RUN cd /home/app && bundle install
WORKDIR /home/app
