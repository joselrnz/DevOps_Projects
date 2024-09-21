variable "workspace_name" {
  description = "The name of the Databricks workspace"
}

variable "location" {
  description = "The location where the Databricks workspace will be created"
}

variable "resource_group_name" {
  description = "The resource group where the Databricks workspace will be deployed"
}

variable "subscription_id" {
  description = "The Azure subscription ID"
}

variable "managed_resource_group_name" {
  description = "The name of the managed resource group for Databricks"
}

variable "vnet_id" {
  description = "The ID of the virtual network"
}

variable "public_subnet_name" {
  description = "The name of the public subnet"
}

variable "private_subnet_name" {
  description = "The name of the private subnet"
}

variable "public_nsg_association_id" {
  description = "The ID of the NSG association for the public subnet"
}

variable "private_nsg_association_id" {
  description = "The ID of the NSG association for the private subnet"
}

variable "enable_no_public_ip" {
  description = "Disable public IP for Databricks workspace"
  type        = bool
  default     = true
}

variable "tier" {
  description = "The pricing tier for the Databricks workspace"
  default     = "premium"
}
