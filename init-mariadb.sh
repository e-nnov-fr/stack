#!/bin/bash
export $(grep -v '^#' .env | xargs)

files=$(ls sql_scripts)
for file in $files
do
    echo $file
    envsubst < sql_scripts/$file | docker exec -i $(docker ps -q -f name=mariadb) sh -c "exec mariadb -uroot -p$MARIADB_ROOT_PASSWORD"

done

