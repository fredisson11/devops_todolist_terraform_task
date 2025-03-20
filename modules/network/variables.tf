variable "prefix" {
  type        = string
  description = "Prefix for resources names"
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
variable "environment" {
  type        = string
  description = "Environment to deploing"
  default     = "Development"
}