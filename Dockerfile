FROM markadams/chromium-xvfb-js

RUN curl -O http://mirrors.163.com/.help/sources.list.jessie &&\
    mv sources.list.jessie /etc/apt/sources.list  &&\
    apt-get update && apt-get install git default-jdk openssh-server -y &&\
    useradd -m -d /home/jenkins -s /bin/sh jenkins &&\
    echo "jenkins:jenkins" | chpasswd &&\
    mkdir -p /var/run/sshd &&\
    npm install -g cnpm --registry=https://registry.npm.taobao.org

EXPOSE 22

# Default command
CMD ["/usr/sbin/sshd", "-D"]
