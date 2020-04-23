#!/bin/bash

docker pull registry.gitlab.e.foundation:5000/e/os/docker-lineage-cicd:community && \
mkdir -p \
/srv/e/src \
/srv/e/zips \
/srv/e/logs \
/srv/e/ccache && \
docker run \
-v "/srv/e/src:/srv/src" \
-v "/srv/e/zips:/srv/zips" \
-v "/srv/e/logs:/srv/logs" \
-v "/srv/e/ccache:/srv/ccache" \
-e "BRANCH_NAME=v1-pie" \
-e "DEVICE_LIST=capricorn" \
-e "OTA_URL=<ota-server-url>" \
-e "REPO=https://gitlab.e.foundation/e/os/android.git" \
registry.gitlab.e.foundation:5000/e/os/docker-lineage-cicd:community
