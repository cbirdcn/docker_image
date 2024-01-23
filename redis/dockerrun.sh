#!/bin/sh
#方式1 直接运行docker run

docker run --name redis \
-p 6379:6379 \
-v /Users/test/Documents/github/docker_image/redis/conf/redis.conf:/etc/redis/redis.conf \
-d redis redis-server /etc/redis/redis.conf --appendonly yes