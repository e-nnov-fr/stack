#!/bin/bash
mongodump --host localhost --username $MONGODB_ROOT_USERNAME --password $MONGODB_ROOT_PASSWORD --db=$DB --gzip -o /dump