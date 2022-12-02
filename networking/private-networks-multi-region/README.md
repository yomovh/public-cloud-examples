# 

This example builds 3 separated private routed networks on 3 regions, and another 3 private routed networks that are connected, within OVHcloud Public Cloud.

The components that will be created are : 

- 6 private networks (built on [vRack](https://www.ovhcloud.com/en-gb/network/vrack)).

- 6 subnets.

- 6 routers.

![Multi Region Private Network](./img/img01.png)

## Pre-requisites

You need to follow steps from the [basics tutorial](../../basics/README.md) for having necessary tools and a fonctionnal `ovhrc` file.

## properties files

This is the parameters needed by the scripts:

![Multi Region Private Network](./img/img02.png)

Edit the `variables.auto.tfvars` file to modify values:

```terraform
// Network common parameters

common = {
        regions                 = ["GRA7","SBG5","GRA9"]
        frontNwName             = "frontNw"
        frontSubnetName         = "frontSubnet"
        frontRouterName         = "frontRouter"
        backNwName              = "backNw"
        backNwVlanId            = 100
        backSubnetName          = "backSubnet"
        backRouterName          = "backRouter"
        portName                = "frontPort"
        }

// Network by regions parameters

z      = [
        {
                region                  = "GRA7"
                frontSubnetCIDR         = "192.168.10.0/24"
                backSubnetCIDR          = "192.168.110.0/24"
                backRouterFrontIP       = "192.168.10.254"
                backRouterBackIP        = "192.168.110.1"
        },{
                region                  = "SBG5"
                frontSubnetCIDR         = "192.168.20.0/24"
                backSubnetCIDR          = "192.168.120.0/24"
                backRouterFrontIP       = "192.168.20.254"
                backRouterBackIP        = "192.168.120.1"
        },{
                region                  = "GRA9"
                frontSubnetCIDR         = "192.168.30.0/24"
                backSubnetCIDR          = "192.168.130.0/24"
                backRouterFrontIP       = "192.168.30.254"
                backRouterBackIP        = "192.168.130.1"
        }
   ]
```

## Create

Create the network environment with this commands:

```bash
source ovhrc
terraform init
terraform plan
terraform apply
```

Or simply use the `createNetworks.sh` script.

```bash
./createNetworks.sh
```

<details><summary>See output</summary>

```bash

```

</details>

## Delete / Purge

Clean you environment with this commands:

```bash
source ovhrc
terraform destroy --auto-approve
```

Or execute the `deleteNetworks.sh` script:

```bash
./deleteNetworks.sh
```

<details><summary>See output</summary>

```bash

```

</details>

