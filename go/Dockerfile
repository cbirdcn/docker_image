FROM scratch

ADD centos-7-x86_64-docker.tar.xz /

LABEL \
    org.label-schema.schema-version="1.0" \
    org.label-schema.name="CentOS Base Image" \
    org.label-schema.vendor="CentOS" \
    org.label-schema.license="GPLv2" \
    org.label-schema.build-date="20201113" \
    org.opencontainers.image.title="CentOS Base Image" \
    org.opencontainers.image.vendor="CentOS" \
    org.opencontainers.image.licenses="GPL-2.0-only" \
    org.opencontainers.image.created="2020-11-13 00:00:00+00:00"

RUN yum update -y \
	&& yum install -y gcc \
	&& yum install -y kde-l10n-Chinese \
	&& yum reinstall -y glibc-common \
	&& localedef -c -f UTF-8 -i zh_CN zh_CN.UTF-8 \
	&& echo 'LANG="zh_CN.UTF-8"' > /etc/locale.conf \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& yum install -y vim \
	&& yum install -y unzip \
	&& yum install -y m4 \
	&& yum install -y net-tools \
	&& yum install -y unzip \
	&& yum install -y lsof \
	&& yum install -y psmisc \
	&& yum install -y wget \
	&& yum install -y tree \
	&& yum install -y telnet \
	&& yum install -y wget \
	&& yum clean all \
	&& rm -rf /tmp/* rm -rf /var/cache/yum/*

ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8

COPY go1.20.12.linux-amd64.tar.gz /usr/local/
COPY protoc-3.11.2-linux-x86_64.zip /usr/local/

WORKDIR /usr/local/

RUN tar -zxf go1.20.12.linux-amd64.tar.gz \
	&& unzip protoc-3.11.2-linux-x86_64.zip \
	&& echo 'export GO111MODULE=on' >> /etc/profile \
	&& echo 'export GOROOT=/usr/local/go' >> /etc/profile \
	&& echo 'export GOPATH=/home/gopath' >> /etc/profile \
	&& echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> /etc/profile \
	&& source /etc/profile \
	&& echo 'source /etc/profile' >> ~/.bashrc \
	&& source ~/.bashrc

WORKDIR /workspace/

EXPOSE 8888 8889 8890

CMD ["/bin/bash"]
