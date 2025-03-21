output "sa_id" {
  value = azurerm_storage_account.example.id
}
output "storage_container_id" {
  value = azurerm_storage_container.task-artifacts.id
}