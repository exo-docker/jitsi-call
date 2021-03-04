FROM exoplatform/jdk:8-ubuntu-1804
ARG JITSI_CALL_VERSION=1.0.1
COPY download.sh /
RUN chmod u+x /download.sh
#Disable caching for /download.sh
ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache
RUN /download.sh
ENTRYPOINT ["java", "-jar", "/jitsi-call.jar"]
