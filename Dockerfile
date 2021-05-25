FROM postgres:12-alpine

RUN apk -U add ca-certificates fuse wget dcron tzdata curl unzip \
  && rm -rf /var/cache/apk/*

# Install rclone
RUN sh -c 'curl -sL https://rclone.org/install.sh | bash -'

ADD dump.sh /dump.sh
RUN chmod +x /dump.sh

ADD start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
CMD [""]
