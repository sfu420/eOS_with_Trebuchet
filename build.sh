#!/bin/bash
echo Start
dpkg -l docker-ce

sudo docker pull registry.gitlab.e.foundation:5000/e/os/docker-lineage-cicd:community
sudo mkdir -p \
/srv/e/src \
/srv/e/zips \
/srv/e/logs \
/srv/e/ccache && \
sudo docker run \
-v "/srv/e/src:/srv/src" \
-v "/srv/e/zips:/srv/zips" \
-v "/srv/e/logs:/srv/logs" \
-v "/srv/e/ccache:/srv/ccache" \
-e "BRANCH_NAME=v1-pie" \
-e "DEVICE_LIST=capricorn" \
-e "OTA_URL=<ota-server-url>" \
-e "REPO=https://gitlab.e.foundation/e/os/android.git" \
registry.gitlab.e.foundation:5000/e/os/docker-lineage-cicd:community
