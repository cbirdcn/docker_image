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
	&& yum install -y subversion \
	&& yum clean all \
	&& rm -rf /tmp/* rm -rf /var/cache/yum/*

ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8

COPY apache-ant-1.9.4-bin.tar.gz /usr/local/
COPY apache-groovy-binary-2.4.5.zip /usr/local/
COPY jdk-8u202-linux-x64.tar.gz /usr/local/

WORKDIR /usr/local/

RUN tar -zxf apache-ant-1.9.4-bin.tar.gz \
	&& unzip apache-groovy-binary-2.4.5.zip \
	&& tar -zxf jdk-8u202-linux-x64.tar.gz \
	&& echo 'export JAVA_HOME=/usr/local/jdk1.8.0_202' >> /etc/profile \
	&& echo 'export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tool.jar' >> /etc/profile \
	&& echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile \
	&& echo 'export ANT_HOME=/usr/local/apache-ant-1.9.4' >> /etc/profile \
	&& echo 'export PATH=$PATH:$ANT_HOME/bin' >> /etc/profile \
	&& echo 'export GROOVY_HOME=/usr/local/groovy-2.4.5' >> /etc/profile \
	&& echo 'export PATH=$PATH:$GROOVY_HOME/bin' >> /etc/profile \
	&& source /etc/profile \
	&& echo 'source /etc/profile' >> ~/.bashrc \
	&& source ~/.bashrc

WORKDIR /workspace/

EXPOSE 6008 8000 27000 27034 29200 29201 55555

CMD ["/bin/bash"]
