ARG UBUNTU_VERSION=25.10

FROM ubuntu:${UBUNTU_VERSION}

LABEL org.opencontainers.image.source="https://github.com/linjixing/ttyd"

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt-get install -y openssh-server ca-certificates git curl wget unzip net-tools iputils-ping tzdata vim nano sudo cron supervisor --no-install-recommends; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    mkdir /var/run/sshd; \
    getent passwd ubuntu > /dev/null && userdel -rf ubuntu; \
    ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
    echo 'Asia/Shanghai' > /etc/timezone; \
    echo 'set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom' >> /etc/vim/vimrc; \
    echo 'set termencoding=utf-8' >> /etc/vim/vimrc; \
    echo 'set encoding=utf-8' >> /etc/vim/vimrc; \
    curl -Lo /usr/bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.$(arch) && chmod +x /usr/bin/ttyd; \
    wget -qO- https://github.com/trzsz/trzsz-go/releases/download/v1.1.8/trzsz_1.1.8_linux_$(arch).tar.gz | tar -xz -C /usr/bin --strip-components=1

EXPOSE 22 7681

COPY init /usr/bin/init
COPY supervisor /etc/supervisor

ENTRYPOINT ["init"]

CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]
