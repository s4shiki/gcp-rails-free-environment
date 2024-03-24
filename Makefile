init-project:
	if [ ! -d "myapp" ]; then \
			mkdir -p myapp/config; \
			cp -f .env.example .env; \
			docker-compose build; \
			docker-compose run web bash -c '\
					cd ./myapp && \
					gem install rails && \
					rails new . -d postgresql && \
					bundle install && \
					cp -f ../rails_config/database.yml.example config/database.yml && \
					echo "データベースを作成します..." && \
					rake db:create && \
					ls -al && \
					echo "新規プロジェクトのセットアップが完了しました。" \
			'; \
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

