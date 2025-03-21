variable "environment" {
  type        = string
  description = "Environment to deploing"
  default     = "Development"
}
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group in which will be the deployment"
}
variable "location" {
  type        = string
  description = "The location for all resources"
  default     = "East US"
}
variable "sa_name_prefix" {
  type        = string
  description = "Prefix for storage account name"
  default     = "default"

  validation {
    condition     = length(var.sa_name_prefix) <= 14 && can(regex("^[a-z0-9]*$", var.sa_name_prefix))
    error_message = "Prefix must be at most 14 characters long and contain only lowercase letters and numbers."
  }
}
variable "sa_tier" {
  type        = string
  description = "Storage account tiet"
  default     = "Standard"
}
variable "sa_replication_type" {
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
