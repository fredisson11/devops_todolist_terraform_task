output "network_interface_id" {
  value = azurerm_network_interface.main.id
}
output "vm_id" {
  value = azurerm_linux_virtual_machine.matebox.id
}
output "vm_extension_id" {
  value = azurerm_virtual_machine_extension.example.id
}
