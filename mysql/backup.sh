#!/bin/sh
# 备份数据
docker run --rm -v `dirname $0`/backup:/backup --volumes-from mysql percona/percona-xtrabackup:8.0 xtrabackup --backup --compress --datadir=/var/lib/mysql/ --target-dir=/backup/`date '+%Y%m%d'` --user=root --password=00#Abc#123 
# 检测备份是否成功，成功删除昨天的备份
if [ $? -eq 0 ]; then
	rm -rf `dirname $0`/backup/`date -d"yesterday" +%Y%m%d`
fi
