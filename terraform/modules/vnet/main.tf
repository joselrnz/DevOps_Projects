resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.vnet_rg
  address_space       = ["10.125.0.0/16"]  # Set your VNet address space
}

# Public subnet with Databricks delegation
resource "azurerm_subnet" "public_subnet" {
  name                 = var.public_subnet_name
  resource_group_name  = var.vnet_rg
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.125.1.0/24"]

  # Delegate to Databricks
  delegation {
    name = "databricks-delegation-public"
    service_delegation {
      name    = "Microsoft.Databricks/workspaces"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    }
  }
}

# Private subnet with Databricks delegation
resource "azurerm_subnet" "private_subnet" {
  name                 = var.private_subnet_name
  resource_group_name  = var.vnet_rg
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.125.2.0/24"]

  # Delegate to Databricks
  delegation {
    name = "databricks-delegation-private"
    service_delegation {
      name    = "Microsoft.Databricks/workspaces"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    }
  }
}

# Output Subnet IDs
output "public_subnet_id" {
  value = azurerm_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = azurerm_subnet.private_subnet.id
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}