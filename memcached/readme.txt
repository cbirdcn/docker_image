memcached

准备：
docker pull memcached:latest

注意：

执行：
docker-compose up -d

测试：
> telnet 127.0.0.1 11211
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
> set k 0 60 1
> v
STORED
> get k
VALUE k 0 1
v
END
> quit
Connection closed by foreign host.