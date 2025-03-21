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
variable "subnet_id" {
  type        = string
  description = "ID of subnet for connect to the network interface"
}
variable "ip_allocation" {
  type        = string
  description = "Private IP-address allocation"
  default     = "Dynamic"
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
variable "public_ssh_key" {
  type        = string
  description = "The SSH public key to be used for authentication to the virtual machine."
}
variable "script_url" {
  type        = string
  description = "Script to download and execute"
  default     = "https://raw.githubusercontent.com/fredisson11/devops_todolist_terraform_task/main/install-app.sh"
}



