#!/bin/sh

git clone https://github.com/cloudfoundry/bosh-lite.git
git clone https://github.com/cloudfoundry/cf-release.git

pushd bosh-lite
      vagrant up --provider virtualbox
      bundle
      bosh --user admin --password admin target 192.168.50.4
      ./scripts/provision_cf
popd

echo "########################################################################"
echo "                                                                        "
echo " REMINDER                                                               "
echo " ========                                                               "
echo "                                                                        "
echo "    You are now ready to run                                            "
echo "                                                                        "
echo "        bosh-lite/scripts/add-route                                     "
echo "                                                                        "
echo "    It might ask you for your sudo password.                            "
echo "                                                                        "
echo "########################################################################"