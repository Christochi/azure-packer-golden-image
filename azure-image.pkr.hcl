locals {

  az_image_name = "${var.az_image_name}-${formatdate("DD-MMM-YYYY-ss-mm-hh", timestamp())}"

}

source "azure-arm" "tochi-image" {

  client_id       = var.client-id
  client_secret   = var.client-secret # client secret value
  subscription_id = var.subscription-id
  tenant_id       = var.tenant-id

  image_publisher = var.img-publisher
  image_offer     = var.img-offer
  image_sku       = var.img-sku

  location = var.location # location of Resource Groug (RG) to create VM

  os_type                           = var.os-type
  managed_image_name                = local.az_image_name
  managed_image_resource_group_name = var.managed-image-rg-name # name of RG to store image

}

build {

  sources = ["source.azure-arm.tochi-image"]

  # install packages using ansible
  provisioner "ansible" {

    playbook_file = var.playbook-dir

  }

}