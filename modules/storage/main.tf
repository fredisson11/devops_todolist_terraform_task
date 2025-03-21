resource "random_string" "sa_name_suffix" {
  length  = 10
  special = false
  upper   = false
}

resource "azurerm_storage_account" "example" {
  name                     = local.sa_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.sa_tier
  account_replication_type = var.sa_replication_type

  tags = {
    environment = var.environment
  }
}

resource "azurerm_storage_container" "task-artifacts" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.example.id
  container_access_type = var.container_access_type
}