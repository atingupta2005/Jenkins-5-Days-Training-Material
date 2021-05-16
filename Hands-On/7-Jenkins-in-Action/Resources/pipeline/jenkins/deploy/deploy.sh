#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

export PROD_VM_IP=vmkenkins-prod.northeurope.cloudapp.azure.com

scp -i /opt/prod /tmp/.auth prod-user@l$PROD_VM_IP:/tmp/.auth
scp -i /opt/prod ./jenkins/deploy/publish.sh prod-user@$PROD_VM_IP:/tmp/publish.sh
ssh -i /opt/prod prod-user@$PROD_VM_IP "/tmp/publish.sh"
