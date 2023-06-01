locals {
  ad-group-ids = {
   dev-group = "85f45e90-0d23-4901-9902-vge9f9f03baa"
   admin-group = "85f45e90-0d23-4901-9902-vge9f9f03bab"
  }  
}
resource "azurerm_role_assignment" "dev-rg" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Reader"
  principal_id         = local.ad-group-ids["dev-group"]
}

resource "azurerm_role_assignment" "admin-priv" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Contributor"
  principal_id         = local.ad-group-ids["admin-group"]
}