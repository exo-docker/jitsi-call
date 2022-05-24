FROM exoplatform/jdk:11-ubuntu-2004
ARG JITSI_CALL_VERSION=1.2.0-20220524
COPY download.sh /
RUN chmod u+x /download.sh
#Disable caching for /download.sh
ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache
RUN /download.sh
HEALTHCHECK CMD curl --fail http://localhost || exit 1
ENTRYPOINT ["java", "-jar", "/jitsi-call.jar"]
