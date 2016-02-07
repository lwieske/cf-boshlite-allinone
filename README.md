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

Starts the VM and uploads the stemcell and release, generates a deployment manifest and in turns deploys it and finally comes up with something like

    Deployed `cf-warden' to `Bosh Lite Director'

    ...

    +---------------------------------------------------------------------------+---------+-----+-----------+--------------+
    | VM                                                                        | State   | AZ  | VM Type   | IPs          |
    +---------------------------------------------------------------------------+---------+-----+-----------+--------------+
    | api_z1/0 (e96ca500-8736-4b23-8f86-a246c4d1298d)                           | running | n/a | large_z1  | 10.244.0.134 |
    | consul_z1/0 (713a1e13-a0f6-45b6-8749-7a7383dbbd76)                        | running | n/a | small_z1  | 10.244.0.54  |
    | doppler_z1/0 (af0de28f-f21d-45aa-8f98-3173abda9633)                       | running | n/a | medium_z1 | 10.244.0.142 |
    | etcd_z1/0 (72d30772-03db-4ad9-bb3c-fa56aecb75d3)                          | running | n/a | medium_z1 | 10.244.0.42  |
    | ha_proxy_z1/0 (45a9cc19-62a7-44ee-80f6-e2902d89123b)                      | running | n/a | router_z1 | 10.244.0.34  |
    | hm9000_z1/0 (c3de45fc-f3af-4d37-a014-9926ab018d8a)                        | running | n/a | medium_z1 | 10.244.0.138 |
    | loggregator_trafficcontroller_z1/0 (f838d361-3952-46e8-b840-6905bd33da9e) | running | n/a | small_z1  | 10.244.0.146 |
    | nats_z1/0 (64b51caf-8a2d-4523-9f7b-8b03eb6f08fa)                          | running | n/a | medium_z1 | 10.244.0.6   |
    | postgres_z1/0 (0578c0ff-7859-4a4a-a0fa-fe935fed3661)                      | running | n/a | medium_z1 | 10.244.0.30  |
    | router_z1/0 (eb06dd07-5604-466e-b5e5-3d53bf61869b)                        | running | n/a | router_z1 | 10.244.0.22  |
    | runner_z1/0 (d8da029a-2657-4250-9ca0-c3b876b5e591)                        | running | n/a | runner_z1 | 10.244.0.26  |
    | uaa_z1/0 (1bda3efd-0fd3-4a30-bed2-d3d1b54b3599)                           | running | n/a | medium_z1 | 10.244.0.130 |
    +---------------------------------------------------------------------------+---------+-----+-----------+--------------+

    VMs total: 12

### Step 4: Deploy CloudFoundry Application

    ./deploy-cf-application.sh

** This takes about 1 minute. **

Sets the api endpoint, target organisation and space, and pushes the app `cf-env`.

### Step 4: Show Web App In The Browser

    open -a safari http://cf-env.bosh-lite.com

** This comes immediately. **
