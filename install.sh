# !/bin/sh

mkdir mysql/data
mkdir mysql/backup
chown 1001:1001 mysql/data
chown 1001:1001 mysql/data
chmod a+x mysql/backup.sh
docker-compose up -d