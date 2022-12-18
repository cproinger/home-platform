#!/bin/bash
# Author: cproinger
# Usage: setting up the photoprism stack for use with curl | /bin/bash

# setup folder structure
mkdir /dockerstuff

mkdir /dockerstuff/git

mkdir /dockerstuff/photoprism
mkdir /dockerstuff/photoprism/storage
mkdir /dockerstuff/photoprism/originals
mkdir /dockerstuff/photoprism/mariadb
mkdir /dockerstuff/photoprism/backup

# make originals folder writable for everyone
chmod a+w -r /dockerstuff/photoprism/originals

# clone this repo
cd /dockerstuff/git
git clone https://github.com/cproinger/home-platform.git

# setup docker compose-stack
cd /dockerstuff/git/home-platform/photoprism
echo "setting up your .env-file for the variables PHOTOPRISM_ADMIN_PASSWORD, PHOTOPRISM_MARIADB_PASSWORD and optionally PHOTOPRISM_SITE_URL"
#echo "then run 'docker-compose -f photoprism-stack.docker-compose.yml up -d'"

echo "enter PHOTOPRISM_ADMIN_PASSWORD"
read PHOTOPRISM_ADMIN_PASSWORD
echo "enter PHOTOPRISM_MARIADB_PASSWORD"
read PHOTOPRISM_ADMIN_PASSWORD
echo "enter PHOTOPRISM_SITE_URL (or leave blank for ip-address-access only)"
read PHOTOPRISM_ADMIN_PASSWORD
echo "writing .env-file"
printf "PHOTOPRISM_ADMIN_PASSWORD=$PHOTOPRISM_ADMIN_PASSWORD\nPHOTOPRISM_MARIADB_PASSWORD=$PHOTOPRISM_MARIADB_PASSWORD\nPHOTOPRISM_SITE_URL=$PHOTOPRISM_SITE_URL" > .env

echo "starting stack with docker-compose"
docker-compose -f photoprism-stack.docker-compose.yml up -d