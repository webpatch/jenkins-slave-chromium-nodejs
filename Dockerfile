FROM markadams/chromium-xvfb-js

RUN curl -O http://mirrors.163.com/.help/sources.list.jessie # 获取163源
RUN mv sources.list.jessie /etc/apt/sources.list # 更新源地址
RUN apt-get update
RUN apt-get install git default-jdk openssh-server -y
RUN useradd -m -d /home/jenkins -s /bin/sh jenkins &&\
    echo "jenkins:jenkins" | chpasswd
RUN mkdir -p /var/run/sshd
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

EXPOSE 22

# Default command
CMD ["/usr/sbin/sshd", "-D"]