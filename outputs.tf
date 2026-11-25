output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}

output "container_name" {
  value = azurerm_storage_container.container.name
}

output "client_secret" {
  value     = azuread_application_password.app.value
  sensitive = true
}
