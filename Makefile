install: install-docker install-gcloud

install-docker:
	@echo "Installing Docker for Mac..."
	brew install --cask docker

install-gcloud:
	@echo "Installing Google Cloud SDK..."
	brew install google-cloud-sdk

create-project:
	@echo "Creating new Rails project..."
	docker compose run web rails new . --force --database=postgresql
	docker compose build
	@echo "Copying database.yml file..."
	cp database.yml.example config/database.yml
	@echo "Creating database..."
	docker compose run web rails db:create

run:
	@echo "Running the application..."
	docker compose up
