terraform {
  # backend "local" {
  #   path = "./terraform/terraform.tfstate"
  # }

  backend "azurerm" {
    resource_group_name  = "<your_resource_group_name>"
    storage_account_name = "<your_storage_account_name>"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
}
