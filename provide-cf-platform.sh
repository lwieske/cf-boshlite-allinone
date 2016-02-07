#!/bin/sh

TARGET=192.168.50.4
USERNAME=admin
PASSWORD=admin

STEMCELL_VERSION=3147
STEMCELL_FILE=stemcells/bosh-stemcell-${STEMCELL_VERSION}-warden-boshlite-ubuntu-trusty-go_agent.tgz

RELEASE_VERSION=230

PATH=$PATH:${PWD}/bin

checkroute=$( route get 10.244.0.0/16 | grep -c "gateway: 192.168.50.4" )
if [ $checkroute -eq 0 ]
then
  echo "###############################"
  echo "#                             #"
  echo "#   bosh-lite/bin/add-route   #"
  echo "#                             #"
  echo "########### Exiting ###########"
  exit
fi

pushd bin
      wget -nc https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.7/spiff_darwin_amd64.zip
      unzip -u spiff_darwin_amd64.zip
popd

pushd stemcells
      wget --content-disposition https://bosh.io/d/stemcells/bosh-warden-boshlite-ubuntu-trusty-go_agent?v=3147
popd

pushd bosh-lite
      vagrant destroy --force
      sleep 10
      vagrant up --provider virtualbox
popd

sleep 10
bosh target ${TARGET}
bosh login ${USERNAME} ${PASSWORD}
bosh upload stemcell ${STEMCELL_FILE} --skip-if-exists
bosh stemcells

echo ${PATH}

pushd cf-release
      scripts/update
      bosh target ${TARGET}
      bosh login ${USERNAME} ${PASSWORD}
      bosh upload release releases/cf-${RELEASE_VERSION}.yml
      scripts/generate-bosh-lite-dev-manifest
      echo "yes" | bosh deploy
popd

bosh vms
