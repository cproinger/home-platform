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
docker-compose -f photoprism-stack.docker-compose.yml up -d
