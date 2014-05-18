## CloudFoundry VM based on Boshlite/Vagrant

### Prerequisite: Vagrant

[Bosh Lite](https://github.com/cloudfoundry/bosh-lite) creates a development environment for [CloudFoundry](http://cloudfoundry.org/) using warden containers in a Vagrant box.

### Step 1: Check Out the Project

    git clone http://github.com/lwieske/cf-boshlite-allinone.git

### Step 2: Provide CloudFoundry Platform

    ./provide-cf-platform.sh

** This may take an hour or so. ** 

Starts clones the `bosh-lite` and `cf-release` repositories, starts the VM and calls `provision_cf`. 

### Step 3: Set Up Network Connectivity

    bosh-lite/scripts/add-route

** This takes less than 1 minute. **

### Step 4: Deploy CloudFoundry Application

    ./deploy-cf-application.sh

** This takes about 1 minute. **

Sets the api endpoint, target organisation and space, and pushes the app `env`.


