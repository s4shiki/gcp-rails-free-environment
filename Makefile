init-project:
	@echo "新規Railsプロジェクトの作成を開始します..."
	mkdir -p myapp
	if [ -z "$$(ls -A myapp)" ]; then \
		docker-compose run --no-deps web rails new . --force --database=postgresql --skip-bundle --skip-javascript --skip-turbolinks --skip-hotwire; \
		echo "Dockerイメージをビルドします..."; \
		docker-compose build; \
		cp -f .env.example .env; \
		cp -f rails_config/database.yml.example ./myapp/config/database.yml; \
		echo "データベースを作成します..."; \
		docker-compose run --rm web rake db:create; \
		docker-compose run --rm web rake db:migrate; \
		echo "新規プロジェクトのセットアップが完了しました。"; \
	else \
		echo "myappディレクトリが既に存在します。新規プロジェクトは作成されませんでした。"; \
	fi

up:
	docker-compose up -d

down:
	docker-compose down

create-db:
	docker-compose run --rm web rake db:create

migrate-db:
	docker-compose run --rm web rake db:migrate

reset-db:
	docker-compose run --rm web rake db:drop db:create db:migrate

seed-db:
	docker-compose run --rm web rake db:seed

test:
	docker-compose run --rm web rake test

console:
	docker-compose run --rm web rails console

logs:
	docker-compose logs -f web

