#!/bin/bash

echo " ---------------------------------------------- "
echo "|                                              |"
echo "|  Initialize Mysql and v2board directory ...  |"
echo "|                                              |"

mkdir -p ../v2board-docker-data/www
mkdir -p ../v2board-docker-data/wwwlogs
mkdir -p ../v2board-docker-data/mysql
mkdir -p ../v2board-docker-data/tls

cp -r config ../v2board-docker-data/config

echo "|                 Initialized.                 |"
echo "|                                              |"
echo " ---------------------------------------------- "

version=$(curl -sL https://api.github.com/repos/v2board/v2board/releases/latest | grep tag_name | head -n 1 | awk -F ":" '{print $2}' |  sed 's/\"//g;s/,//g;s/ //g')

echo "|                                              |"
echo "|             Fetch v2board ${version}              |"
echo "|                                              |"
echo "|    https://github.com/v2board/v2board.git    |"
echo "|                                              |"

git clone -q https://github.com/v2board/v2board.git ../v2board-docker-data/www

echo "|                   Fetched.                   |"
echo "|                                              |"
echo "|----------------------------------------------|"
echo "|                                              |"
echo "|             Initialize v2board.              |"
echo "|                                              |"
echo " ---------------------------------------------- "
echo "/n/n"
cd ../v2board-docker-data/www/
sh init.sh