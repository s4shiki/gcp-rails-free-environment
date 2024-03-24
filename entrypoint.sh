#!/bin/bash
set -e

# config/database.ymlがなければ、exampleからコピー
if [ ! -f config/database.yml ]; then
  cp rails_config/database.yml.example config/database.yml
fi

# Postgresが起動するまで待機
echo "Waiting for postgres..."
while ! nc -z $DB_HOST 5432; do
  sleep 0.1
done

echo "Postgres is up - executing command"
# マイグレーション実行
bundle exec rake db:migrate || bundle exec rake db:setup

# Railsサーバー起動
exec "$@"
