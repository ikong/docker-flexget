FROM frolvlad/alpine-python3

RUN apk --no-cache add tzdata ca-certificates \
  && pip install -I flexget transmissionrpc \
  && mkdir -p /root/.flexget \
  && touch /root/.flexget/config.yml \
  && cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
  && echo "Europe/Moscow" > /etc/timezone \
  && apk del tzdata

# expose port for flexget webui
EXPOSE 5050 5050/tcp 

COPY bootstrap.sh /root/bootstrap.sh

RUN chmod +x /root/bootstrap.sh

CMD ["/root/bootstrap.sh"]
