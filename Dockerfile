FROM  oberthur/docker-ubuntu:16.04
MAINTAINER  anonymous

# - Install packages
# - OpenSSH needs /var/run/sshd to run
# - Remove generic host keys, entrypoint generates unique keys
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install openssh-server && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/sshd && \
    rm -f /etc/ssh/ssh_host_*key*

COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint /
COPY README.md /

EXPOSE 22

ENTRYPOINT ["/entrypoint"]
