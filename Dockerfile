## -*- docker-image-name: "mauler/simple-ftp-server" -*-

FROM python:slim
MAINTAINER EURANOVA <info@euranova.eu>

ENV FTP_ROOT /ftp-home
ENV FTP_USER ftp
ENV FTP_PASS ftp
ENV FTP_PORT 21
ENV FTP_MAX_CONNECTIONS 256
ENV FTP_MAX_CONNECTIONS_PER_IP 50

VOLUME /ftp-home

ADD image/root/ /

RUN pip install pyftpdlib && \
    mkdir -pv $FTP_ROOT

EXPOSE $FTP_PORT

ENTRYPOINT /bin/simple-ftp-server
