variable "environment" {
  type        = string
  description = "Deployment environment (e.g., Development, Staging, Production)."
  default     = "Development"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group where all resources will be deployed."
  default     = "mate-azure-task-12"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be deployed."
  default     = "uksouth"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network (VNet) for the infrastructure."
  default     = "vnet"
}

variable "vnet_address_prefix" {
  type        = list(string)
  description = "Address space for the virtual network."
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet within the virtual network."
  default     = "default"
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "Address range for the subnet."
  default     = ["10.0.0.0/24"]
}

variable "public_ip_address_name" {
  type        = string
  description = "Name of the public IP address associated with the VM."
  default     = "linuxboxpip"
}

variable "ip_allocation" {
  type        = string
  description = "IP allocation method for the public IP address (Dynamic or Static)."
  default     = "Dynamic"
}

variable "dns_label" {
  type        = string
  description = "DNS label for the public IP address."
  default     = "matetask"
}

variable "network_security_group_name" {
  type        = string
  description = "Name of the Network Security Group (NSG)."
  default     = "defaultnsg"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine."
  default     = "matebox"
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine (e.g., Standard_B1s, Standard_D2s_v3)."
  default     = "Standard_B1s"
}

variable "os_hostname" {
  type        = string
  description = "Hostname of the virtual machine."
  default     = "hostname"
}

variable "admin_username" {
  type        = string
  description = "Administrator username for the virtual machine."
  default     = "testadmin"
}

variable "is_os_disks_will_deleted_on_termination" {
  type        = bool
  description = "Whether the OS disk should be automatically deleted when the VM is terminated."
  default     = false
}

variable "is_data_disks_will_deleted_on_termination" {
  type        = bool
  description = "Whether data disks should be automatically deleted when the VM is terminated."
  default     = false
}

variable "ssh_key_public" {
  description = "Path to the file containing the public SSH key for VM authentication."
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "install_app_script_url" {
  type        = string
  description = "URL of the installation script to be downloaded and executed on the VM."
  default     = "https://raw.githubusercontent.com/fredisson11/devops_todolist_terraform_task/main/install-app.sh"
}

variable "storage_account_name_prefix" {
  type        = string
  description = "Prefix for the storage account name (must be max 14 characters, lowercase, and alphanumeric)."
  default     = "default"

  validation {
    condition     = length(var.storage_account_name_prefix) <= 14 && can(regex("^[a-z0-9]*$", var.storage_account_name_prefix))
    error_message = "Prefix must be at most 14 characters long and contain only lowercase letters and numbers."
  }
}

variable "storage_account_tier" {
  type        = string
  description = "Storage account performance tier (Standard or Premium)."
  default     = "Standard"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Storage account replication type (LRS, GRS, ZRS, etc.)."
  default     = "LRS"
}

variable "container_name" {
  type        = string
  description = "Name of the storage container."
  default     = "task-artifacts"
}

variable "container_access_type" {
  type        = string
  description = "Access type of the storage container (private, blob, or container)."
  default     = "private"
}