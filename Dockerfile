FROM exoplatform/jdk:17-ubuntu-2204
ARG JITSI_CALL_VERSION=1.5.0-M10
COPY download.sh /
RUN chmod u+x /download.sh
RUN /download.sh
HEALTHCHECK CMD curl --fail http://localhost || exit 1
ENTRYPOINT ["java", "-jar", "/jitsi-call.jar"]
