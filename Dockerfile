FROM python:3-alpine

RUN pip install -I flexget transmissionrpc \
  && mkdir -p /root/.flexget \
  && touch /root/.flexget/config.yml

# expose port for flexget webui
EXPOSE 5050 5050/tcp
VOLUME /root/.flexget

COPY bootstrap.sh /root/bootstrap.sh

RUN chmod +x /root/bootstrap.sh

CMD ["/root/bootstrap.sh"]
