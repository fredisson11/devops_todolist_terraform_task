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
variable "virtual_network_name" {
  type        = string
  description = ""
  default     = "vnet"
}
variable "virtual_network_address_space" {
  type        = list(string)
  description = ""
  default     = ["10.0.0.0/16"]
}
variable "subnet_name" {
  type        = string
  description = ""
  default     = "default"
}
variable "subnet_address_space" {
  type        = list(string)
  description = ""
  default     = ["10.0.0.0/24"]
}
variable "public_ip_name" {
  type        = string
  description = ""
  default     = "linuxboxpip"
}
variable "ip_allocation" {
  type        = string
  description = ""
  default     = "Dynamic"
}
variable "domain_name_prefix" {
  type        = string
  description = "Environment to deploing"
  default     = "matetask"
}
variable "network_security_group_name" {
  type        = string
  description = ""
  default     = "defaultnsg"
}