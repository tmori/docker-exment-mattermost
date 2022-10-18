#!/bin/bash

docker-compose down --rmi all --volumes --remove-orphans
rm -f volumes/config/*