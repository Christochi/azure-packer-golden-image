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