FROM louislam/uptime-kuma:1.23.13-debian as base-image

RUN echo "deb http://deb.debian.org/debian buster-backports main non-free" >> /etc/apt/sources.list
RUN apt update && apt upgrade -y
RUN apt install -y wireguard htop iperf3 iputils-ping iproute2 net-tools dnsutils dumb-init openresolv

COPY /root /

ENTRYPOINT ["/usr/bin/dumb-init", "--", "extra/entrypoint.sh"]
USER root
CMD ["bash", "/docker-entrypoint.sh"]
