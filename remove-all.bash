#!/bin/bash

docker-compose down --rmi all --volumes --remove-orphans
rm -rf volumes/mattermost/config/*
rm -rf volumes/mattermost/data/*
rm -rf volumes/mattermost/logs/*
