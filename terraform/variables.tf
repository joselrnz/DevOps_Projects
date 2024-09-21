# Location for the resources
variable "location" {
  description = "The location where the resources will be created"
}

# Resource group for Databricks and related resources
variable "resource_group_name" {
  description = "The resource group where Databricks and associated resources will be deployed"
}

# Virtual network name
variable "vnet_name" {
  description = "The name of the virtual network"
}

# Resource group for VNet and subnets
variable "vnet_rg" {
  description = "The resource group for the VNet and subnets"
}

# Public subnet name
variable "public_subnet_name" {
  description = "The name of the public subnet"
}

# Private subnet name
variable "private_subnet_name" {
  description = "The name of the private subnet"
}

# Network Security Group (NSG) name
variable "nsg_name" {
  description = "The name of the Network Security Group (NSG)"
}

# Databricks workspace name
variable "workspace_name" {
  description = "The name of the Databricks workspace"
}

# Subscription ID for Databricks workspace and managed resource group
variable "subscription_id" {
  description = "The Azure subscription ID"
}

# Managed resource group for Databricks
variable "managed_resource_group_name" {
  description = "The managed resource group for Databricks"
}

# Pricing tier for Databricks workspace
variable "tier" {
  description = "The pricing tier for the Databricks workspace (e.g., premium or standard)"
  default     = "premium"
}

# Disable or enable public IP for Databricks
variable "enable_no_public_ip" {
  description = "Boolean to enable or disable public IP for Databricks"
  type        = bool
  default     = true
}
