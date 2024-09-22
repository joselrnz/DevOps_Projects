location                   = "eastus"
resource_group_name         = "rg-name"
vnet_name                   = "my-vnet2"
vnet_rg                     = "vnet-rg"  # Resource group for VNet and subnets
subscription_id             = "subID"  # Replace with your subscription ID
managed_resource_group_name =  "databricks-mrg-myworkspace"  # Specify your managed RG name
workspace_name              = "my-databricks-workspace"
tier                        = "premium"  # Specify the Databricks pricing tier
enable_no_public_ip         = true       # Set to true or false as needed
nsg_name                    = "databricks-nsg"  # Name of the NSG
public_subnet_name          = "sub-public"
private_subnet_name          = "sub-private"


