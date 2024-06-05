FROM exoplatform/jdk:21-ubuntu-2204
ARG JITSI_CALL_VERSION=7.0.0-20240605
COPY download.sh /
RUN chmod u+x /download.sh
RUN /download.sh
HEALTHCHECK CMD curl --fail http://localhost || exit 1
ENTRYPOINT ["java", "-jar", "/jitsi-call.jar"]
