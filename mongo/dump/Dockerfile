FROM mongo:7.0.11

COPY dump.sh /usr/local/bin/dump.sh
RUN chmod +x /usr/local/bin/dump.sh

CMD ["/usr/local/bin/dump.sh"]