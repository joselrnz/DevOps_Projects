variable "location" {
  description = "The location where the NSG will be created"
}

variable "nsg_name" {
  description = "The name of the Network Security Group"
}

variable "vnet_rg" {
  description = "The resource group where the VNet and subnets are located"
}

variable "public_subnet_id" {
  description = "The ID of the public subnet to associate with the NSG"
}

variable "private_subnet_id" {
  description = "The ID of the private subnet to associate with the NSG"
}
