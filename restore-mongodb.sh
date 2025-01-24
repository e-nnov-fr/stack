docker build -t e-nnov/mongorestore mongo/restore
docker run --rm --name mongorestore --env-file .env --network host -v /home/debian/restore/mongodb:/dump e-nnov/mongorestore