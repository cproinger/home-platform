echo "sourcing bucket-config.sh"
. bucket-config.sh
aws s3 sync /dockerstuff/photoprism/originals s3://$BUCKET_NAME/originals