FROM alpine:3.20

# Ultra light base for RAM bypass on free tiers (Railway/others)
RUN apk add --no-cache \
    openssh \
    sudo \
    curl \
    bash \
    nano \
    net-tools \
    dropbear \
    && mkdir -p /var/run/sshd /root/.ssh \
    && echo 'root:dev' | chpasswd \
    && ssh-keygen -A \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config \
    && echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config \
    && echo "UsePAM no" >> /etc/ssh/sshd_config

# Optional ngrok (lightweight)
RUN curl -sL https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz | tar xz -C /usr/local/bin || true

EXPOSE 22 80 443 8080

# Keep process alive + low memory
CMD ["/usr/sbin/sshd", "-D", "-e"]
