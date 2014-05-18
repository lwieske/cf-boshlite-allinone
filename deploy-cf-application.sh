#!/bin/sh

export ORG=my
export SPACE=space

cf api --skip-ssl-validation https://api.10.244.0.34.xip.io
cf auth admin admin

cf create-org $ORG
cf target -o $ORG
cf create-space $SPACE
cf target -o $ORG -s $SPACE

git clone https://github.com/cloudfoundry-community/cf-env.git

pushd cf-env
      bundle
      cf push cf-env
popd

cf apps