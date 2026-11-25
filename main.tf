resource "azurerm_resource_group" "rg" {
  name     = "rg-uvu-it3200-${var.student_name}"
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = "it3200blobstorage1"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public = false
  shared_access_key_enabled       = false
  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
}

resource "azurerm_storage_container" "container" {
  name                  = "reports"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}

resource "azuread_application" "app" {
  display_name = "app-uvu-it3200-${var.student_name}"
}

resource "azuread_service_principal" "app" {
  client_id = azuread_application.app.client_id
}

resource "azuread_application_password" "app" {
  application_id = azuread_application.app.id
}

resource "azurerm_role_assignment" "blob_access" {
  scope = "${azurerm_storage_account.storage.id}/blobServices/default/containers/${azurerm_storage_container.container.name}"

  role_definition_name = "Storage Blob Data Contributor"

  principal_id = azuread_service_principal.app.object_id

  principal_type = "ServicePrincipal"
}

resource "azurerm_storage_container" "restricted" {
  name                  = "restricted"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}