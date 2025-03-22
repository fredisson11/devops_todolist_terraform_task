# Deployment Instructions

This guide will walk you through the deployment process using Terraform, as well as how to migrate your backend to Azure.

## 1. Deployment

To deploy the infrastructure and resources, run the following Terraform command:

```bash
terraform apply -auto-approve
```

This command will automatically apply the configuration and create all necessary resources.

## 2. Backend Migration

To migrate the backend from local storage to Azure, follow the steps below:

### 2.1 Comment Out the Local Backend Configuration

Open the `backend.tf` file and comment out the local backend configuration:

```hcl
backend "local" {
  path = "./terraform/terraform.tfstate"
}
```

### 2.2 Uncomment the Azure Backend Configuration

Uncomment the Azure backend block in the same `backend.tf` file:

```hcl
# backend "azurerm" {
#   resource_group_name  = "<your_resource_group_name>"
#   storage_account_name = "<your_storage_account_name>"
#   container_name       = "tfstate"
#   key                  = "terraform.tfstate"
#   use_oidc             = true
# }
```

### 2.3 Add Resource Group and Storage Account Names

In the `backend.tf` file, replace the placeholders `<your_resource_group_name>` and `<your_storage_account_name>` with the actual names of your resource group and storage account. You can find these values from the Azure Portal or in the outputs of your Terraform run (e.g., `rg_name` and `sa_name`).

For example:

```hcl
backend "azurerm" {
  resource_group_name  = "my-resource-group"
  storage_account_name = "mystorageaccount"
  container_name       = "tfstate"
  key                  = "terraform.tfstate"
  use_oidc             = true
}
```

### 2.4 Initialize and Migrate State

After updating the backend configuration, run the following command to initialize and migrate the state to Azure:

```bash
terraform init -migrate-state
```

When prompted, type `yes` to confirm the migration of the state.

---

**Use the `variables.tf` file to conveniently manage the entered data.**
