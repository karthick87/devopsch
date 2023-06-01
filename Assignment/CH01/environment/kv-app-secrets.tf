resource "azurerm_key_vault" "ch01-secrets" {
  lifecycle                   {
    ignore_changes = [
      access_policy,
    ]
  }

  resource_group_name         = azurerm_resource_group.rg.name
  location                    = azurerm_resource_group.rg.location
  name                        = "ch01-three-tier-kv"
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
}

resource "azurerm_key_vault_secret" "b-username" {
  lifecycle {
    ignore_changes = [
      value
    ]
  }
  key_vault_id = azurerm_key_vault.ch01-secrets.id
  name         = "backend-username"
  value        = ""
}

resource "azurerm_key_vault_secret" "b-password" {
  lifecycle {
    ignore_changes = [
      value
    ]
  }

  key_vault_id = azurerm_key_vault.ch01-secrets.id
  name         = "backend-password"
  value        = ""
}