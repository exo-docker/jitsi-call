FROM exoplatform/jdk:11-ubuntu-2004
ARG JITSI_CALL_VERSION=1.3.x-SNAPSHOT
COPY download.sh /
RUN chmod u+x /download.sh
RUN /download.sh
HEALTHCHECK CMD curl --fail http://localhost || exit 1
ENTRYPOINT ["java", "-jar", "/jitsi-call.jar"]
