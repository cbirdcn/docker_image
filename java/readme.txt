java8游戏服务器

准备：
从common将下列文件拷贝到当前路径下
centos-7-x86_64-docker.tar.xz
apache-ant-1.9.4-bin.tar.gz
apache-groovy-binary-2.4.5.zip
jdk-8u202-linux-x64.tar.gz

注意：
docker-compose将workspace文件夹挂载到了volume
开放众多端口
不自动重启
如果环境变量无法生效就source /etc/profile

执行：
docker build -t centos7_java:v1.0 .
docker-compose up -d
