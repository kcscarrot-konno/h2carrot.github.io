FROM ruby:3.1.4

WORKDIR /app

VOLUME /app

RUN apt-get update

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve", "--watch", "--host", "0.0.0.0"]
