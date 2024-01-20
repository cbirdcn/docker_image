docker容器启动过程

不需要生成镜像

docker-compose up -d

etcd三集群，2379是容器内服务运行绑定端口，23791-23793是对外提供的映射端口。2380是集群内部通信端口，对外提供23801-23803。

数据映射到本地路径$PWD/etcd$i-data

ETCDCTL_API=3