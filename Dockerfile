FROM azul/zulu-openjdk-alpine:21-latest

ARG JITSI_CALL_VERSION=7.2.0-M29

# Install tini for proper init (signal forwarding + zombie reaping)
# and curl for the healthcheck, in a single layer with no extra cache
RUN apk update && \
  apk upgrade && \
  apk add --no-cache curl tini

# Download the application jar
COPY download.sh /download.sh
RUN chmod u+x /download.sh \
 && /download.sh \
 && rm /download.sh

# Run as a non-root user
RUN addgroup -S jitsi && adduser -S -G jitsi -H -s /sbin/nologin jitsi
USER jitsi

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD curl --fail http://localhost || exit 1

ENTRYPOINT ["/sbin/tini", "--", "java", "-jar", "/jitsi-call.jar"]