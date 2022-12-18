#!/bin/bash
echo "starting photoprism-mariadb-backup at $(date '+%Y-%m-%d_%H-%M')" > /dockerstuff/photoprism/backup/backup.log
docker-compose -f /dockerstuff/git/home-platform/photoprism/photoprism-stack.docker-compose.yml exec -T photoprism photoprism backup -i - | gzip > /dockerstuff/photoprism/backup/photoprism_mariadb_$(date '+%Y-%m-%d').sql.gz
echo "finished photoprism-mariadb-backup at $(date '+%Y-%m-%d_%H-%M')" > /dockerstuff/photoprism/backup/backup.log