resource "azurerm_service_plan" "ch01-three-tier-env-asp" {
  name                = "ch01-3tier-environment-asp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_app_service" "app-ingestion" {
  name                       = "ch01-asp" 
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = azurerm_resource_group.rg.location
  app_service_plan_id        = azurerm_service_plan.ch01-three-tier-env-asp.id
  https_only                 = true
   
  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}

resource "azurerm_function_app" "backend" {
  name                       = "ch01-backend-fncapp"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_service_plan.ch01-three-tier-env-asp.id
  storage_account_name       = azurerm_storage_account.sto_acc_eh.name
  storage_account_access_key = azurerm_storage_account.sto_acc_eh.primary_access_key
}

resource "azurerm_function_app" "data-proce" {
  name                       = "ch01-dataproc-fncapp"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_service_plan.ch01-three-tier-env-asp.id
  storage_account_name       = azurerm_storage_account.sto_acc_eh.name
  storage_account_access_key = azurerm_storage_account.sto_acc_eh.primary_access_key
}