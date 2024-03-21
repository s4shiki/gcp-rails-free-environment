install: install-docker install-gcloud

install-docker:
	@echo "Installing Docker for Mac..."
	brew install --cask docker

install-gcloud:
	@echo "Installing Google Cloud SDK..."
	brew install google-cloud-sdk

create-project:
	@echo "Creating new Rails project..."
	docker compose build
	docker compose run web rails new . --force --database=postgresql
	@echo "Copying database.yml file..."
	cp ./src/database.yml.example ./src/config/database.yml
	@echo "Creating database..."
	docker compose run web rails db:create

run:
	@echo "Running the application..."
	docker compose up
