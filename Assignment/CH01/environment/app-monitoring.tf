resource "azurerm_application_insights" "apm" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name                = "ch01-app-monitoring"
  application_type    = "web"
}