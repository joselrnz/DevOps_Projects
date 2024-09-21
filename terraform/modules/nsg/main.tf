resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.vnet_rg
}

# Associate NSG with public subnet
resource "azurerm_subnet_network_security_group_association" "public_nsg_association" {
  subnet_id                 = var.public_subnet_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Associate NSG with private subnet
resource "azurerm_subnet_network_security_group_association" "private_nsg_association" {
  subnet_id                 = var.private_subnet_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Output NSG association IDs
output "public_nsg_association_id" {
  value = azurerm_subnet_network_security_group_association.public_nsg_association.id
}

output "private_nsg_association_id" {
  value = azurerm_subnet_network_security_group_association.private_nsg_association.id
}
