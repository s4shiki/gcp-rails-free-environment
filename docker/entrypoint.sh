#!/bin/bash
set -e

# データベースが起動するまで待機
# wait-for-it.sh db:5432 -- echo "Database is up"

# データベースマイグレーションを実行
# マイグレーションは Makefile で既に実行しているため、本番環境や他の環境でのみ必要な場合に実行
# echo "Running database migrations..."
# rails db:migrate

# Railsサーバーを起動
echo "Starting Rails server..."
bin/rails server -b 0.0.0.0
