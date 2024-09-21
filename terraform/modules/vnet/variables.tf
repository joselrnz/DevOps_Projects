variable "location" {
  description = "The location where the VNet and subnets will be created"
}

variable "vnet_name" {
  description = "The name of the virtual network"
}

variable "vnet_rg" {
  description = "The resource group for the virtual network and subnets"
}

variable "public_subnet_name" {
  description = "The name of the public subnet"
}

variable "private_subnet_name" {
  description = "The name of the private subnet"
}
