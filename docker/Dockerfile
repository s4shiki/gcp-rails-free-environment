# マルチステージビルドを用いた効率的なイメージ構築
# ステージ1: Ruby ベースイメージで依存関係をインストール
FROM ruby:3.1 AS Builder
WORKDIR /app
# BundlerとNode.jsのインストール
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get update -qq && apt-get install -y nodejs postgresql-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/* 
COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test

# ステージ2: 実行専用の軽量イメージを構築
FROM ruby:3.1-slim AS Runtime
WORKDIR /app
COPY --from=Builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=Builder /app /app
COPY . .
# エントリーポイントスクリプトをコピー
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
