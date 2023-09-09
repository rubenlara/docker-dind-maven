FROM docker:dind

ARG MAVEN_APK_VERSION
ARG JDK_APK_PACKAGE

RUN apk add --no-cache bash $JDK_APK_PACKAGE "maven=$MAVEN_APK_VERSION"
RUN apk add --no-cache git

RUN runtimeLine=$(mvn --version | grep runtime) && jvmPath=${runtimeLine#*runtime: } && echo "export JAVA_HOME=$jvmPath" >> ~/.bashrc

COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh
WORKDIR /usr/local/src
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD bash
