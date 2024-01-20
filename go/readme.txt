docker镜像构建和容器启动过程

准备：
从common将下列文件拷贝到当前路径下
centos-7-x86_64-docker.tar.xz
go1.20.12.linux-amd64.tar.gz
protoc-3.11.2-linux-x86_64.zip

注意：
docker-compose将workspace文件夹挂载到了volume
开放端口8888-8890
自动重启
如果环境变量无法生效就source /etc/profile

执行：
docker build -t centos7_go:v1.0 .
docker-compose up -d
