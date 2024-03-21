setup:
	# コンテナをビルド
	docker-compose build
	# Rails アプリケーションを生成
	docker-compose run --rm web rails new . --force --database=postgresql --skip-bundle
	# Gemfileが更新されたので再ビルド
	docker-compose build
	# コピーする設定ファイルがあればここで実行
	make copy-config
	# コンテナを起動
	docker-compose up -d
	# データベースの作成とマイグレーション
	docker-compose run --rm web rails db:create db:migrate

copy-config:
	# 必要な設定ファイルをコピー
	cp -f docker/database.yml config/database.yml


# データベースの作成、マイグレーション、シードデータの投入
db-setup:
	docker-compose exec web rails db:create db:migrate db:seed

# コンテナのビルドと起動
up:
	docker-compose up -d

# コンテナの停止と削除
down:
	docker-compose down

.PHONY: setup copy-config
