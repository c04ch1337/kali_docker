
FROM kalilinux/kali-rolling

LABEL maintainer="Guy Fawkes <guy.fawkes@underground.ops>"

# Set noninteractive mode
ENV DEBIAN_FRONTEND=noninteractive

# Update & install packages
RUN apt update && apt upgrade -y && apt install -y kali-linux-default openssh-server metasploit-framework nmap net-tools curl wget cron smbclient python3 python3-pip git dnsutils ftp postfix mailutils mutt && apt clean

# Setup SSH
RUN echo 'root:toor' | chpasswd && sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Startup script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
