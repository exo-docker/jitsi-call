FROM exoplatform/jdk:11-ubuntu-2004
ARG JITSI_CALL_VERSION=1.2.0-20220328
COPY download.sh /
RUN chmod u+x /download.sh
#Disable caching for /download.sh
ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache
RUN /download.sh
ENTRYPOINT ["java", "-jar", "/jitsi-call.jar"]
