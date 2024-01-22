kafka

准备：
从common将下列文件拷贝到当前路径下
centos-7-x86_64-docker.tar.xz
apache-ant-1.9.4-bin.tar.gz
apache-groovy-binary-2.4.5.zip
jdk-8u202-linux-x64.tar.gz

注意：
docker-compose将data和log挂载到了当前路径下
开放众多端口
自动重启

参数说明：
KAFKA_ADVERTISED_LISTENERS：kafka会在zookeeper中使用这个参数进行注册，如果不设置，zk就无法向外提供broker的信息,这里填写kafka的ip地址，暂时用host.docker.internal代替。
KAFKA_CREATE_TOPICS：kafka启动后初始化一个有2个partition(分区)0个副本名叫test的topic 
KAFKA_LISTENERS：kafka的tcp侦听ip地址 例如“127.0.0.1”，那么只有与该ip正确连接的客户端能成功连接到kafka；

执行：
docker-compose up -d
