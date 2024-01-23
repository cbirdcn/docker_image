redis

两种方式构建容器

方法一：
run.sh，直接docker run

方法二：
Dockerfile, docker-compose

准备：
docker pull redis

注意：
需要将conf/redis.conf映射到容器内，所以redis.conf配置要提前准备好，不同的版本有不同的配置，需要到官网确认，目前配置是7.2最新版本。
redis-server是带配置启动，`/etc/redis/redis.conf`
redis.conf修改了下列配置：
appendonly yes
protected-mode no
bind 0.0.0.0
requirepass "" # 允许无密码访问。有密码如123456
daemonize yes

执行：
docker build -t redis:v1.0 .
docker-compose up -d
