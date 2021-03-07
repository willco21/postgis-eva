#!/bin/bash -ex

#docker pull postgis/postgis:12-master
mkdir -p init
#echo 'CREATE EXTENSION postgis;' > init/init.sql

docker-compose up -d
docker exec -it postgis_container bash
