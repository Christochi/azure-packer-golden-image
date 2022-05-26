# local variable stores name of the base image with time stamp 
locals {

  az_image = "${var.az_image_name}-${formatdate("DD-MMM-YYYY-ss-mm-hh", timestamp())}"

}

# source block defines configuration for creating a parker build
source "azure-arm" "azure-image" {

  client_id       = var.client-id
  client_secret   = var.client-secret
  subscription_id = var.subscription-id
  tenant_id       = var.tenant-id

  image_publisher = var.img-publisher
  image_offer     = var.img-offer
  image_sku       = var.img-sku

  location = var.location

  os_type                           = var.os-type
  managed_image_name                = local.az_image
  managed_image_resource_group_name = var.managed-image-rg-name

}