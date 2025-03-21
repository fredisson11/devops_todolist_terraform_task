output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
output "subnet_id" {
  description = "ID of the created subnet"
  value       = azurerm_subnet.default.id
}
output "public_ip_id" {
  value = azurerm_public_ip.linuxboxpip.id
}
output "nsg_id" {
  value = azurerm_network_security_group.defaultnsg.id
}