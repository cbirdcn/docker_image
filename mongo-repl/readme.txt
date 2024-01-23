mongodb三副本分片集群

准备：
docker pull mongo:latest

注意：
分别将容器内的conf、data、logs映射到当前路径下
conf中提供了mongodb配置.conf和mongo副本之间通信的秘钥文件.key。key文件是用`openssl rand -base64 756 > mongo.key`生成的。
三副本分别将27017端口映射到宿主机的27011-27013端口
如果容器无法启动，且`logs/1/mongo.log`提示`mongo.key are too open`以及`Unable to acquire security key[s]`，需要修改权限为`chmod 600 mongo.key`
默认不自动重启

参数说明：
见mongo.conf

参考：
https://www.cnblogs.com/jiagooushi/p/16477696.html
https://blog.51cto.com/u_15187242/2744717
https://www.cnblogs.com/ejiyuan/p/17255287.html
https://github.com/cbirdcn/cbirdcn.github.io/blob/main/practice/MongoDB-%E9%9B%86%E7%BE%A4%E9%AB%98%E5%8F%AF%E7%94%A8%E4%B8%8E%E5%AE%9E%E8%B7%B5.md

执行：
docker-compose up -d

手动操作创建账号和集群：
创建账号过程没有做到镜像中，需要进入容器手动添加集群和认证。先创建集群，再添加root账户，会自动同步账户信息
> mongosh
# 创建集群，注意host中主机名必须是docker-compose中的主机名，不能是ip，否则找不到。`_id`要与docker-compose中`--replSet rs`名称一致
> rs.initiate({ 
    _id:"rs",
    members:[  
        {_id:0,host:"mongo-1:27017"}, 
        {_id:1,host:"mongo-2:27017"}, 
        {_id:2,host:'mongo-3:27017'},
    ]
})
# 添加账户
> use admin
> db.createUser(
{ 
    user:'root',
    pwd:'123456',
    roles:[{ role:'userAdminAnyDatabase', db: 'admin'}, 'readWriteAnyDatabase','clusterAdmin']
});
# 检查集群状态
> rs.status()
# 客户端连接检查
PRIMARY地址：mongodb://root:123456@localhost:27011/?directConnection=true&authMechanism=DEFAULT
# mongosh下次连接，注意主从
mongosh --port 27017 -u "root" -p "123456" --authenticationDatabase