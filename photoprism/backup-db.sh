#!/bin/bash
BACKUP_TS=$(date '+%Y-%m-%d_%H-%M')
TARGET_FILE="/dockerstuff/photoprism/backup/photoprism_mariadb_${BACKUP_TS}.sql.gz"
echo "starting photoprism-mariadb-backup at $(date '+%Y-%m-%d_%H-%M')" > /dockerstuff/photoprism/backup/backup.log
docker-compose -f /dockerstuff/git/home-platform/photoprism/photoprism-stack.docker-compose.yml exec -T photoprism photoprism backup -i - | gzip -9 > $TARGET_FILE
echo "finished photoprism-mariadb-backup at $(date '+%Y-%m-%d_%H-%M')" > /dockerstuff/photoprism/backup/backup.log

echo "sourcing bucket-config.sh"
. /dockerstuff/git/home-platform/photoprism/bucket-config.sh
echo "copying backupfile to s3"
aws s3 cp $TARGET_FILE s3://$BUCKET_NAME/mariadb/ --storage-class DEEP_ARCHIVE