FROM ruby:3.2-alpine

# 必要なパッケージのインストール
RUN apk add --update --no-cache build-base postgresql-dev postgresql-client tzdata bash

# 作業ディレクトリの設定
WORKDIR /myapp

# GemfileとGemfile.lockをコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Bundlerを使ってGemをインストール
RUN bundle install

# アプリケーションのファイルをコピー
COPY . /myapp

# ポート3000を公開
EXPOSE 3000

# エントリーポイントスクリプトをコピーし、実行可能にする
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# メインプロセスの設定
CMD ["rails", "server", "-b", "0.0.0.0"]
