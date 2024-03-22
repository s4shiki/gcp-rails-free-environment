#!/bin/bash
set -e

# データベースが起動するまで待つ処理（必要に応じて）

# データベースマイグレーションを実行
echo "Running database migrations..."
bin/rails db:migrate

# Railsサーバーを起動
echo "Starting Rails server..."
bin/rails server -b 0.0.0.0
