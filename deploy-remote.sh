#!/bin/bash
export $(grep -v '^#' .env | xargs)

files='-f docker-compose.yml -f docker-compose.remote.yml'

docker compose ${files} pull
eval "docker stack deploy ${files//-f/-c} stack"