resource "azurerm_resource_group" "rg" {
    name     = "ch01-three-tier-environment"
    location = "West US"
}

data "azurerm_client_config" "current" {
}