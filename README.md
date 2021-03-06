# mysql-redis
使用docker快速部署mysql,redis,适合测试环境和小型系统快速部署

# 部署前提条件
安装好docker,docker-compose,git 以下示例部署在/opt 目录下面
```
cd /opt
git clone https://github.com/zhoujunhe/mysql-redis.git
```
# 安装命令启动命令
```
cd mysql-redis/
chmod a+x install.sh
./install.sh
```
查看数据库是否启动程序
```
docker ps
```
查看数mysql,redis日志信息
```
docker logs -f mysql    #查看实例mysql
docker logs -f redis    #查看实例redis
```
# 说明

mysql 的root 密码在```docker-compose.yml```文件中```MYSQL_ROOT_PASSWORD``` 定义 <br>
mysql的my.cnf 文件在 mysql目录下面<br>
redis 的初始密码在```redis/redis.conf```文件中```requirepass``` 定义

# 连接到数据库命令

* 连接到mysql
```
mysql -h 127.0.0.1 -u root -p
```
* 连接到redis 
```
redis 
AUTH password
```

# 备份

mysql/backup.sh 只做全量备份，同时只保留一天的备份集，如果需要更多的备份集，请自行修改脚本。
```
/opt/mysql-redis/mysql/backup.sh
```
或者直接加入定时备分任务，比如每天4点做全量压缩备份
```
crontab -e
0 4 * * * /opt/mysql-redis/mysql/backup.sh
```
