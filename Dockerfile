FROM ruby:2.6

ENV BUNDLER_VERSION=2.1.4

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client npm
RUN npm install -g npm@latest
RUN npm install --global yarn

RUN gem install bundler -v 2.1.4

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle check || bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
