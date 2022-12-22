# Prerequisites
* docker
* docker-compose
* cUrl (to obtain the setup.sh-file which pulls this repo)
* awscli (for Backup to s3)

```
sudo apt-get install docker
sudo apt-get install docker-compose
sudo apt-get install curl
```

# Setup

```
curl https://raw.githubusercontent.com/cproinger/home-platform/master/photoprism/setup.sh | sudo /bin/bash
``` 
## Cron

```
# photoprism-db-backup (sundays at 02:00)
0 2 * * SUN . /dockerstuff/git/home-platform/photoprism/backup-all.sh
```