FROM exoplatform/jdk:21-ubuntu-2404
ARG JITSI_CALL_VERSION=7.1.0-20251028
COPY download.sh /
RUN chmod u+x /download.sh
RUN /download.sh
HEALTHCHECK CMD curl --fail http://localhost || exit 1
ENTRYPOINT ["java", "-jar", "/jitsi-call.jar"]
