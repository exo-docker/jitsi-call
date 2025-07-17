FROM azul/zulu-openjdk-alpine:21-latest
ARG JITSI_CALL_VERSION=7.1.0-M07
COPY download.sh /
RUN chmod u+x /download.sh
RUN /download.sh
HEALTHCHECK CMD curl --fail http://localhost || exit 1
ENTRYPOINT ["java", "-jar", "/jitsi-call.jar"]
