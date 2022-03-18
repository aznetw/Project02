provider "azurerm" {
features {}
}

resource "azurerm_resource_group" "example" {
  name     = "aznetwstor"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "storageproject001"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = "democontainer"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}   