## CloudFoundry VM based on Boshlite/Vagrant

![CloudFoundry](https://www.cloudfoundry.org/wp-content/uploads/2015/10/CloudFoundryCorp_cmyk.jpg)

### Prerequisite: Vagrant

[Bosh Lite](https://github.com/cloudfoundry/bosh-lite) creates a development environment for [CloudFoundry](http://cloudfoundry.org/) using warden containers in a Vagrant box.

### Step 1: Check Out the Project

    git clone --recursive  http://github.com/lwieske/cf-boshlite-allinone.git

    cd cf-boshlite-allinone

### Step 2: Provide CloudFoundry Platform

    ./provide-cf-platform.sh

** The first run might take an hour or so. **

** Subsequent runs take about 20 minutes. **

Starts the VM, uploads the stemcell and release, generates a deployment manifest, and deploys it.

### Step 4: Deploy CloudFoundry Application

    ./deploy-cf-application.sh

** This takes about 1 minute. **

Sets the api endpoint, target organisation and space, and pushes the app `cf-env`.

### Step 4: Show Web App In The Browser

    open -a safari http://cf-env.bosh-lite.com

** This comes immediately. **
