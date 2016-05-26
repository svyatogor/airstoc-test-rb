FROM ruby:2.3
ENV HOME /
RUN mkdir -p /app
WORKDIR /app

ADD Gemfile* /app/
RUN bundle install

COPY . /app

CMD rails s -b 0.0.0.0
EXPOSE 3000
