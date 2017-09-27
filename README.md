Provisioning Docker Swarm on Scaleway
=======================

This is an work in progress, and has not been tested fully.

# Requirements

## Configuration variables

* Organization Key, and Access key from Scaleway as environment variables:
  ``export SCALEWAY_ORGANIZATION=xxxxxx``
  ``export SCALEWAY_TOKEN=xxxxx``
 
* TF variables
  ``worker_instance_count``: how many workers (default 2)
  ``manager_instance_type``: type of VM for manager (default VC1S)
  ``worker_instance_type``: type of VM for manager (default VC1S)
  ``region``: type of VM for manager (default ams1)
  
## Packages

* Terraform installed
* jq installed

# Get started

## Inititate:
Download plugins for used by the TF scripts by running ``terraform init``.

## Define workspace
For example set workspace as production with ``terraform workspace new production``

## Plan
See if what the plan is by using ``terraform plan``

## Apply
Apply with ``terraform apply``

# Information

## Storage Driver
I'm using overlay2 as the storage driver as recommended in the docker docs. `https://docs.docker.com/engine/userguide/storagedriver/selectadriver/`.
This is defined in the docker template file.

## External Data Source
I use an external data source that uses SSH to fetch information from the first manager node. You should note that you need to have a valid private key in ~/.ssh/id_rsa for that to work. TODO: use key from MOS (ministry of secret repo).