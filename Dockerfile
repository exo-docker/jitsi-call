FROM exoplatform/jdk:8-ubuntu-1804
ARG JITSI_CALL_VERSION=0.0.5-SNAPSHOT
COPY download.sh /
RUN chmod u+x /download.sh 
RUN /download.sh
ENTRYPOINT ["java", "-jar", "/jitsi-call.jar"]
