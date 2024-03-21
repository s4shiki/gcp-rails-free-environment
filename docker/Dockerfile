# Rubyの公式イメージをベースとして使用
FROM ruby:3.1

# パッケージのインストールに必要なリストを更新し、基本的な依存関係をインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# 作業ディレクトリを作成
WORKDIR /myapp

# Gemfile と Gemfile.lock のコピー（この部分は既に問題ないはずですが、問題があればパスを確認してください）
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# entrypoint.sh のコピー
COPY ./docker/entrypoint.sh /usr/bin/entrypoint.sh

# Bundlerを使用してGemをインストール
RUN bundle install

# 現在のディレクトリの内容をコンテナの作業ディレクトリにコピー
COPY . /myapp

# entrypoint.shをコピーし、実行可能にする
COPY docker/entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# コンテナが起動する際に実行されるコマンドを設定
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
