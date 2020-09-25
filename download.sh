#!/bin/bash -eux
echo "Downloading Jitsi Call App version ${JITSI_CALL_VERSION}"
GROUP_ID=org.exoplatform
ARTIFACT_ID=jitsi-call
DOWNLOAD_URL="https://repository.exoplatform.org/service/local/artifact/maven/redirect?r=exo-addons-snapshots&g=${GROUP_ID}&a=${ARTIFACT_ID}&v=${JITSI_CALL_VERSION}"
wget -O /jitsi-call.jar ${DOWNLOAD_URL}
