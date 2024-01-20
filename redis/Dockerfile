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
	&& yum install -y make \
	&& yum clean all \
	&& rm -rf /tmp/* rm -rf /var/cache/yum/*

ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8

COPY redis.conf /etc/
COPY redis-7.2.4.tar.gz /usr/local/

WORKDIR /usr/local/

RUN tar -zxf redis-7.2.4.tar.gz

WORKDIR /usr/local/redis-7.2.4/src

RUN make \
	&& make install PREFIX=/usr/local/redis

WORKDIR /usr/local/redis

RUN echo 'export PATH=$PATH:/usr/local/redis/bin' >> /etc/profile \
	&& source /etc/profile \
	&& echo 'source /etc/profile' >> ~/.bashrc \
	&& source ~/.bashrc

COPY start_redis.sh /usr/local/

RUN chmod +x /usr/local/start_redis.sh

WORKDIR /data/

EXPOSE 6379

CMD ["/bin/bash"]
