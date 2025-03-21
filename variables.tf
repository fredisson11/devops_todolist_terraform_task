variable "environment" {
  type        = string
  description = "Environment to deploing"
  default     = "Development"
}
variable "resource_group_name" {
  type        = string
  description = ""
  default     = "mate-azure-task-12"
}
variable "location" {
  type        = string
  description = ""
  default     = "uksouth"
}
variable "virtual_network_name" {
  type        = string
  description = ""
  default     = "vnet"
}
variable "vnet_address_prefix" {
  type        = list(string)
  description = ""
  default     = ["10.0.0.0/16"]
}
variable "subnet_name" {
  type        = string
  description = ""
  default     = "default"
}
variable "subnet_address_prefix" {
  type        = list(string)
  description = ""
  default     = ["10.0.0.0/24"]
}
variable "public_ip_address_name" {
  type        = string
  description = ""
  default     = "linuxboxpip"
}
variable "ip_allocation" {
  type        = string
  description = ""
  default     = "Dynamic"
}
variable "dns_label" {
  type        = string
  description = ""
  default     = "matetask"
}
variable "network_security_group_name" {
  type        = string
  description = ""
  default     = "defaultnsg"
}
variable "vm_name" {
  type        = string
  description = ""
  default     = "matebox"
}
variable "vm_size" {
  type        = string
  description = ""
  default     = "Standard_B1s"
}
variable "os_hostname" {
  type        = string
  description = ""
  default     = "hostname"
}
variable "admin_username" {
  type        = string
  description = ""
  default     = "testadmin"
}
variable "is_os_disks_will_deleted_on_termination" {
  type        = bool
  description = "Delete the OS disk automatically when deleting the VM"
  default     = true
}
variable "is_data_disks_will_deleted_on_termination" {
  type        = bool
  description = "Delete the data disk automatically when deleting the VM"
  default     = true
}
variable "ssh_key_public" {
  description = "Path to a file with a public SSH key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
variable "script_url" {
  type        = string
  description = "Script to download and execute"
  default     = "https://raw.githubusercontent.com/fredisson11/devops_todolist_terraform_task/main/install-app.sh"
}
variable "storage_account_name_prefix" {
  type        = string
  description = "Prefix for storage account name"
  default     = "default"

  validation {
    condition     = length(var.storage_account_name_prefix) <= 14 && can(regex("^[a-z0-9]*$", var.storage_account_name_prefix))
    error_message = "Prefix must be at most 14 characters long and contain only lowercase letters and numbers."
  }
}
variable "storage_account_tier" {
  type        = string
  description = "Storage account tiet"
  default     = "Standard"
}
variable "storage_account_replication_type" {
  type        = string
  description = "Storage account replication type"
  default     = "LRS"
}
variable "countainer_name" {
  type        = string
  description = ""
  default     = "task-artifacts"
}
variable "container_access_type" {
  type        = string
  description = ""
  default     = "private"
}