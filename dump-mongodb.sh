docker build -t e-nnov/mongodump mongo/dump
docker run --rm --name mongodump --env-file .env --network host -v /home/debian/backup/mongodb:/dump e-nnov/mongodump