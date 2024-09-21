provider "azurerm" {
  features {}
}

# Resource Group (Assumes it already exists)
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Call the VNet module
module "vnet" {
  source              = "./modules/vnet"
  location            = data.azurerm_resource_group.rg.location
  vnet_name           = var.vnet_name
  vnet_rg             = var.vnet_rg
  public_subnet_name  = var.public_subnet_name
  private_subnet_name = var.private_subnet_name
}

# Call the NSG module
module "nsg" {
  source              = "./modules/nsg"
  location            = data.azurerm_resource_group.rg.location
  nsg_name            = var.nsg_name
  vnet_rg             = var.vnet_rg
  public_subnet_id    = module.vnet.public_subnet_id
  private_subnet_id   = module.vnet.private_subnet_id
}

# Call the Databricks module
module "databricks" {
  source                        = "./modules/databricks"
  location                      = data.azurerm_resource_group.rg.location
  workspace_name                = var.workspace_name
  resource_group_name           = data.azurerm_resource_group.rg.name
  subscription_id               = var.subscription_id
  managed_resource_group_name   = var.managed_resource_group_name
  vnet_id                       = module.vnet.vnet_id  # Now correctly referencing the VNet ID
  public_subnet_name            = var.public_subnet_name
  private_subnet_name           = var.private_subnet_name
  public_nsg_association_id     = module.nsg.public_nsg_association_id
  private_nsg_association_id    = module.nsg.private_nsg_association_id
  enable_no_public_ip           = var.enable_no_public_ip
  tier                          = var.tier
}
