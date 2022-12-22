echo "starting backup-all-and-update at $(date '+%Y-%m-%d_%H-%M')"
. /dockerstuff/git/home-platform/photoprism/backup-all.sh
. /dockerstuff/git/home-platform/photoprism/update.sh
echo "finished backup-all-and-update at $(date '+%Y-%m-%d_%H-%M')"