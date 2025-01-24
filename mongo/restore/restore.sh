#!/bin/bash
cd /dump

for folder in */
do
    collection=$(echo "${folder%/}")

    if [[ $collection == "admin" ]]
    then
        continue
    fi

    namespace=$(echo "$collection.*")

    echo "Restoring $collection"
   	mongorestore --host localhost --username $MONGODB_ROOT_USERNAME --password $MONGODB_ROOT_PASSWORD --drop --gzip --nsInclude=${namespace} /dump
done