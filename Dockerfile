FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
#WORKDIR /myapp

#COPY Gemfile /myapp/Gemfile
#COPY Gemfile.lock /myapp/Gemfile.lock
#RUN bundle install

#VOLUME .:/myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

#ADD . /myapp


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
#EXPOSE 3005

CMD ["rails", "server", "-b", "0.0.0.0"]
