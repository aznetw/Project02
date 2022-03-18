provider "azurerm" {
features {}
}

resource "azurerm_resource_group" "example" {
  name     = "aznetwstor"
  location = "West Europe"
}

resource "azurerm_sql_server" "example" {
  name                         = "sqll001"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = "West US"
  version                      = "12.0"
  administrator_login          = "HMmachine"
  administrator_login_password = "december@2021"

}

resource "azurerm_sql_database" "example" {
  name                = "sqldbb001"
  resource_group_name = azurerm_resource_group.example.name
  location            = "West US"
  server_name         = azurerm_sql_server.example.name

}