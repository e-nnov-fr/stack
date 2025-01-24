FROM mongo:7.0.11

COPY restore.sh /usr/local/bin/restore.sh
RUN chmod +x /usr/local/bin/restore.sh

CMD ["/usr/local/bin/restore.sh"]