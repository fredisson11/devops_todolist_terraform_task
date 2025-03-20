variable "vm_name" {
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
variable "public_ssh" {
  type        = string
  description = "The SSH public key to be used for authentication to the virtual machine."
}
variable "subnet_id" {
  type        = string
  description = "ID of subnet for connect to the network interface"
}
variable "ip_allocation" {
  type        = string
  description = "Private IP-address allocation"
  default = "Dynamic"
}
variable "vm_size" {
  type        = string
  description = "Environment to deploing"
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
variable "download_files_Uris" {
  type        = list(string)
  description = "List of file URIs to download"
  # default = [ "https://my-storage-account.blob.core.windows.net/scripts/install-app.sh" ]
}
variable "" {
  type        = string
  description = ""
  default     = ""
}
variable "is_data_disks_will_deleted_on_termination" {
  type        = bool
  description = "Delete the data disk automatically when deleting the VM"
  default     = true
}
variable "is_os_disks_will_deleted_on_termination" {
  type        = bool
  description = "Delete the OS disk automatically when deleting the VM"
  default     = true
}
variable "" {
  type        = string
  description = ""
  default     = ""
}


