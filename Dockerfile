FROM ruby:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs

# Set working directory
WORKDIR /src

# Copy Gemfile and Gemfile.lock
COPY ./src/Gemfile ./src/Gemfile.lock ./

# Install gems
RUN bundle install

## Copy the rest of the application code
#COPY . .
#
## Set up database
#RUN rails db:create db:migrate

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]