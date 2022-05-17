# Azure Packer Image

## Description
builds custom image using a base image from azure, uploads the files and installs necessary applications in the custom image

## Requirement
- install packer
- working knowledge of ansible

## Setup
- add the values for `client-id`, `client-secret`, `subscription-id`, `tenant-id`, `az_image_name`, `managed-image-rg-name`, in `variables.auto.pkrvars.hcl.example` file

#### Usage Example
~~~
client-id             = "c5bgyg0-575-556z-419a-..."
client-secret         = "AdCD419~F...."
subscription-id       = "c4774376-......"
tenant-id             = "b9rc7889-....."
az_image_name         = "your-custom-image-name"
managed-image-rg-name = "your-resource-group" # not parker created
~~~

- you can also change the `location`, `img-publisher`, `img-offer`, `img-sku`, `os-type` in the `variables.auto.pkrvars.hcl` **(optional)**

#### Usage Example
~~~
img-publisher         = "Redhat"
img-offer             = "RHEL"
img-sku               = "8.2"
location              = "Canada Central"
os-type               = "Linux"
~~~

- rename the `variables.auto.pkrvars.hcl.example` to `variables.auto.pkrvars.hcl`

- run `packer fmt .` for formatting code **(optional)**
- run `packer validate .` for ensuring no syntax error **(optional)**
- run `packer build .` for building the image