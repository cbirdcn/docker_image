mysql单机服务器

准备：

注意：
端口映射3306
restart
可能会出现MYSQL_ROOT_PASSWORD指定的密码无法登录的情况，原因在于volumes没有变更（https://stackoverflow.com/questions/40149880/docker-mysql-root-password-do-not-work）
所以，当有密码修改或重新构建时，请先`docker-compose down`停止挂载，再清理掉原来挂载的宿主机文件，再重新构建。
backup文件夹下提供了my.cnf配置文件。因为mysql默认会读取`/etc/my.cnf（默认配置）`、`/etc/mysql/mysql.conf.d（空文件夹）`等文件。所以容器成功创建后再将my.cnf拷贝到mysql.conf.d中检查配置重启即可，否则需要提前创建挂载路径。

执行：
docker-compose up -d

检查：
进入容器检查密码和配置
> docker exec -it mysql5.7 /bin/sh
> mysql -uroot -p
> show variables like "%max_connections%";
