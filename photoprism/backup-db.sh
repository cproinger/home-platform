#!/bin/bash
BACKUP_TS=$(date '+%Y-%m-%d_%H-%M')
TARGET_FILE="/dockerstuff/photoprism/backup/photoprism_mariadb_${BACKUP_TS}.sql.gz"
echo "starting photoprism-mariadb-backup at $(date '+%Y-%m-%d_%H-%M')" > /dockerstuff/photoprism/backup/backup.log
docker-compose -f /dockerstuff/git/home-platform/photoprism/photoprism-stack.docker-compose.yml exec -T photoprism photoprism backup -i - | gzip > $TARGET_FILE
echo "finished photoprism-mariadb-backup at $(date '+%Y-%m-%d_%H-%M')" > /dockerstuff/photoprism/backup/backup.log