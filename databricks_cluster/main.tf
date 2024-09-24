terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.46"
    }
    databricks = {
      source  = "databrickslabs/databricks"
      version = "~> 0.3"
    }
  }
  required_version = ">= 0.12"
}

provider "azurerm" {
  features {}
}

# Reference to an existing resource group (replace with your actual resource group name)
data "azurerm_resource_group" "example" {
  name = "resourcegroupname"
}

# Reference to an existing Databricks workspace
data "azurerm_databricks_workspace" "existing" {
  name                = "my-databricks-workspace"
  resource_group_name = data.azurerm_resource_group.example.name
}

# Configure the Databricks provider using the existing workspace URL

provider "databricks" {
  host                        = data.azurerm_databricks_workspace.existing.workspace_url
  azure_workspace_resource_id = data.azurerm_databricks_workspace.existing.id
  azure_use_msi = true
}
# Deploy a Databricks cluster
resource "databricks_cluster" "personal_cluster" {
  cluster_name  = "Joses Personal Compute Cluster"
  spark_version = "7.3.x-scala2.12"
  node_type_id  = "Standard_DS3_v2"
  autotermination_minutes = 10

  # Single-user access mode
  num_workers = 1  

  # Optional: Configure Spark environment
  spark_conf = {
    "spark.databricks.delta.preview.enabled" = true
  }

}

output "workspace_url" {
  value = data.azurerm_databricks_workspace.existing.workspace_url
}

output "cluster_id" {
  value = databricks_cluster.personal_cluster.id
}
