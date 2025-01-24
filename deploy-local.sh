#!/bin/bash
export $(grep -v '^#' .env | xargs)

files='-f docker-compose.yml -f docker-compose.local.yml'

docker compose ${files} up -d