FROM ruby:3.2-alpine

# 必要なパッケージのインストール
RUN apk add --update --no-cache build-base postgresql-dev postgresql-client tzdata bash git \
    libxml2-dev libxslt-dev gcompat sqlite-dev

# 作業ディレクトリの設定
WORKDIR /myapp

# GemfileとGemfile.lockをコピー
#COPY Gemfile /myapp/Gemfile
#COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle init
RUN gem install rails
RUN bundle install
# アプリケーションのファイルをコピー
COPY . /myapp

# ポート3000を公開
EXPOSE 3000

# メインプロセスの設定
CMD ["rails", "server", "-b", "0.0.0.0"]
