基于ubuntu14.04的python服务器

准备：
docker pull ubuntu:14.04
从common将下列文件拷贝到当前路径下
Python-3.6.1.tar.xz


注意：
公共项目用Dockerfile-public
私有项目用Dockerfile-private
原项目是Dockerfile
mono在http://download.mono-project.com/sources/mono/mono-6.12.0.182.tar.xz下载，或`sudo apt install mono-devel`
cert是在网站`https://crt.sh/?d=9314791`生成的，用于从私有网站下载pythonnet源码，也可以在https://github.com/pythonnet/pythonnet.git
因为依赖包安装过程不稳定，所以改成了使用离线包安装具体看Dockerfile内描述

执行：
docker build -t ubuntu14_python:v1.0 .
docker-compose up -d
