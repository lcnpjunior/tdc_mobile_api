FROM ruby:2.3.5
RUN apt-get update -qq && apt-get install -y build-essential libmysqlclient-dev
ADD . /app
WORKDIR /app
RUN bundle install && rails db:migrate RAILS_ENV=development
EXPOSE 3000
CMD [ "puma"]