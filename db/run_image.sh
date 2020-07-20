#!/bin/bash
docker rm bigdata-db

docker run --name bigdata-db \
  -e POSTGRES_PASSWORD=testPassword \
  -p 5433:5432 \
  -d postgres

# The following psql command must be run manually from a terminal which will
# interactively request the password (testPassword).
# Alternatively you can install a tool like pgAdmin and connect to the DB
# server that should be running on host=localhost and port=5433. The default
# user (called postgres) is kept in this example.
# psql -h localhost -U postgres -p 5433 < initialize.sql
