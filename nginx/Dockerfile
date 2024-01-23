FROM nginx:1.13-alpine
# ARG USER_ID
# ARG GROUP_ID
RUN apk add --update --no-cache tzdata shadow && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    # usermod -u ${USER_ID:-1000} nginx && groupmod -g ${GROUP_ID:-1000} nginx && \
    apk del tzdata && \
    mkdir -p /var/www
ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD conf/default.conf /etc/nginx/conf.d/default.conf
WORKDIR /var/www
