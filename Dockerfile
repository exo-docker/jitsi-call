FROM exoplatform/jdk:21-ubuntu-2604

ARG JITSI_CALL_VERSION=7.2.0-20260512

# Install tini for proper init (signal forwarding + zombie reaping)
# and curl for the healthcheck, in a single layer with no extra cache
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      tini \
      curl \
 && rm -rf /var/lib/apt/lists/*

# Drop pebble as we use tini
RUN rm -f /usr/bin/pebble \
    && rm -rf /var/lib/pebble \
    && rm -rf /etc/pebble

# Download the application jar
COPY download.sh /download.sh
RUN chmod u+x /download.sh \
 && /download.sh \
 && rm /download.sh

# Run as a non-root user
RUN useradd --system --no-create-home --shell /usr/sbin/nologin jitsi
USER jitsi

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD curl --fail http://localhost || exit 1

ENTRYPOINT ["/usr/bin/tini", "--", "java", "-jar", "/jitsi-call.jar"]
