#!/bin/bash

if [ -d mattermost-initializer ]
then
    :
else
    echo "ERROR: can not found mattermost-initializer"
    exit 1
fi

cd mattermost-initializer
source env/env.bash


if [ -d input/base-data ]
then
    :
else
    mkdir input/base-data
fi
bash input/tools/reset.bash input/base-data/

if [ -d input/base-data/user ]
then
    :
else
    mkdir input/base-data/user
fi

bash test-data/create.bash 10
bash batch/setup.bash
