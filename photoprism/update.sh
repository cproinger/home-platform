cd /dockerstuff/git/home-platform/photoprism
docker-compose -f photoprism-stack.docker-compose.yml down
git pull
docker-compose -f photoprism-stack.docker-compose.yml pull
docker-compose -f photoprism-stack.docker-compose.yml up -d