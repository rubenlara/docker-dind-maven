FROM docker:dind

RUN apk add --no-cache ${JDK_IMAGE:openjdk11} bash maven
COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh
WORKDIR /usr/local/src
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD bash
