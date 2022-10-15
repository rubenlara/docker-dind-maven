ARG MAVEN_APK_VERSION
ARG JDK_APK_PACKAGE

FROM docker:dind

RUN apk add --no-cache bash maven==$MAVEN_APK_VERSION
RUN apk --no-cache add $JDK_APK_PACKAGE

COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh
WORKDIR /usr/local/src
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD bash
