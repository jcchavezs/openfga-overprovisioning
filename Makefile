deps:
	go install github.com/openfga/cli/cmd/fga@main

run: deps
	docker compose up -d openfga
	fga store import --api-url http://localhost:8080 --file model/model.fga.yaml | jq -r '"FGA_STORE_ID=" + .store.id + "\nFGA_AUTHORIZATION_MODEL_ID="+ .model.authorization_model_id' > openfga.store.env
	docker compose up fga-drive-example
	open localhost:3000

stop:
	docker compose stop