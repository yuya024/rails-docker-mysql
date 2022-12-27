FROM ruby:3.0

RUN apt-get update && apt-get install -y \
    nodejs \ 
    yarn

WORKDIR /rails-dev

COPY Gemfile* /rails-dev/
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "s", "-b", "0.0.0.0"]
