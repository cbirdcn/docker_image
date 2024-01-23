redis

准备：
从common将下列文件拷贝到当前路径下
centos-7-x86_64-docker.tar.xz
redis-7.2.4.tar.gz

注意：
redis需要编译，耗时有点久
docker-compose将workspace文件夹挂载到了volume
开放众多端口
不自动重启
如果环境变量无法生效就source /etc/profile

配置文件redis.conf是从官网下载的7.2版本，并修改：
appendonly yes
protected-mode no
bind 0.0.0.0
requirepass 123456
daemonize yes

执行：
docker build -t centos7_redis:v1.0 .
docker-compose up -d
