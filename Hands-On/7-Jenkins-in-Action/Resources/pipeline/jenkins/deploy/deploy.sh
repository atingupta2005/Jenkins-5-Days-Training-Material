#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /opt/prod /tmp/.auth prod-user@l<prod-vm-ip>:/tmp/.auth
scp -i /opt/prod ./jenkins/deploy/publish.sh prod-user@<prod-vm-ip>:/tmp/publish.sh
ssh -i /opt/prod prod-user@<prod-vm-ip> "/tmp/publish.sh"
