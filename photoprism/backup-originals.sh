echo "sourcing bucket-config.sh"
. /dockerstuff/git/home-platform/photoprism/bucket-config.sh
aws s3 sync /dockerstuff/photoprism/originals s3://$BUCKET_NAME/originals --storage-class DEEP_ARCHIVE --no-progress