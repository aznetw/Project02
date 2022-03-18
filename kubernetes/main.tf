provider "azurerm" {
features {}
}

resource "azurerm_resource_group" "example" {
  name     = "aznetwstor"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "k8s001"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "k8s"

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}