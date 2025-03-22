terraform {
  # backend "azurerm" {
  #   resource_group_name  = var.resource_group_name
  #   storage_account_name = module.storage.sa_name
  #   container_name       = "tfstate"
  #   key                  = "terraform.tfstate"
  #   use_oidc             = true
  # }
  backend "local" {
    path = "./terraform/terraform.tfstate"
  }
}
