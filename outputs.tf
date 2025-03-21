output "vnet_id" {
  description = "ID of the created virtual network (VNet)."
  value       = module.network.vnet_id
}

output "subnet_id" {
  description = "ID of the created subnet within the VNet."
  value       = module.network.subnet_id
}

output "public_ip_id" {
  description = "ID of the created public IP address."
  value       = module.network.public_ip_id
}

output "nsg_id" {
  description = "ID of the created Network Security Group (NSG)."
  value       = module.network.nsg_id
}

output "network_interface_id" {
  description = "ID of the created network interface (NIC)."
  value       = module.compute.network_interface_id
}

output "vm_id" {
  description = "ID of the deployed virtual machine."
  value       = module.compute.vm_id
}

output "vm_extension_id" {
  description = "ID of the VM extension used for custom script execution."
  value       = module.compute.vm_extension_id
}

output "sa_id" {
  description = "ID of the created storage account."
  value       = module.storage.sa_id
}

output "storage_container_id" {
  description = "ID of the created storage container."
  value       = module.storage.storage_container_id
}