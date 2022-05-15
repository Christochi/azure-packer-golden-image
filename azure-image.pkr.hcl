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

###############################
#### Variable Declaration #####
###############################

variable "client-id" {

  type        = string
  description = "id of the App (Service Principal) accessing azure resources"
  default     = ""

}

variable "client-secret" {

  type        = string
  description = "client secret value"
  default     = ""

}

variable "subscription-id" {

  type        = string
  description = "subscription your app (SP) is registered in"
  default     = ""

}

variable "tenant-id" {

  type        = string
  description = "active directory tenant identifier"
  default     = ""

}


variable "img-publisher" {

  type        = string
  description = "name of the publisher to use for your base image"
  default     = ""

}

variable "img-offer" {

  type        = string
  description = ""
  default     = ""

}

variable "img-sku" {

  type        = string
  description = ""
  default     = ""

}

variable "location" {

  type        = string
  description = "location of Resource Groug (RG) to create VM"
  default     = ""

}

variable "os-type" {

  type        = string
  description = "OS type to configure an SSH authorized key"
  default     = ""

}

variable "az_image_name" {

  type        = string
  description = "placeholder for the parker build or image"
  default     = ""

}

variable "managed-image-rg-name" {

  type        = string
  description = "name of RG to store image"
  default     = ""

}

variable "playbook-dir" {

  type        = string
  description = "anisble playbook path"
  default     = ""

}