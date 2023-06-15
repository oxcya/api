rundb:
	sudo docker run --name postgresalpine -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:15.3-alpine3.17

createdb:
	sudo docker exec -it postgresalpine createdb --username=root --owner=root imageboard_db

dropdb:
	sudo docker exec -it postgresalpine dropdb imageboard_db

migrateup:
	migrate --path db --database "postgresql://root:secret@localhost:5432/sample_db?sslmode=disable" --verbose up

migratedown:
	migrate --path db --database "postgresql://root:secret@localhost:5432/sample_db?sslmode=disable" --verbose down


.PHONY: createdb dropdb rundb migrateup migratedown 
