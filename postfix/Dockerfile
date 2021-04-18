FROM docker.io/library/alpine:3

RUN apk update && \
    apk add --no-cache supervisor postfix rsyslog && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /var/log/supervisor/ /var/run/supervisor/

COPY etc/ /etc/
COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 25

CMD [ "/run.sh" ]
