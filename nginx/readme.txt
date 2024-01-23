php-fpm

准备：
docker pull nginx:1.13-alpine

注意：
开放80端口
在conf的default.conf中，配置了对php的解析，联通到host.docker.internal的9000端口

两段运行：
docker build -t nginx:v1.0 .
docker-compose up -d

一段运行：
命令行提供参数，编译+启动
docker-compose up -d
