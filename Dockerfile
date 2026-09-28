FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Full Ubuntu + high resource style
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    curl \
    wget \
    nano \
    htop \
    net-tools \
    iputils-ping \
    docker.io \
    vim \
    git \
    && mkdir -p /var/run/sshd \
    && echo 'root:dev' | chpasswd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config \
    && ssh-keygen -A

# Ngrok
RUN curl -sL https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz | tar xz -C /usr/local/bin || true

EXPOSE 22 80 443 8080

CMD ["/usr/sbin/sshd", "-D", "-e"]
