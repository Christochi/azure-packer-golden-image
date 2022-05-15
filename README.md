# Azure Packer Image

## Description
builds custom image using a base image from azure, uploads the files and installs necessary applications in the custom image

## Requirement
- install packer
- working knowledge of ansible

## Setup
- add the values for `client-id`, `client-secret`, `subscription-id`, `tenant-id`, `az_image_name`, `managed-image-rg-name`, in `variables.auto.pkrvars.hcl.example` file
- rename the `variables.auto.pkrvars.hcl.example` to `variables.auto.pkrvars.hcl`
- you can also change the `location`, `img-publisher`, `img-offer`, `img-sku`, `os-type` in the `variables.auto.pkrvars.hcl` **(optional)**
- run `packer fmt .` for formatting code **(optional)**
- run `packer validate .` for ensuring no syntax error **(optional)**
- run `packer build .` for building the image