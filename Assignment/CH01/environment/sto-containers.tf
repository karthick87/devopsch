resource "azurerm_eventhub_namespace" "ehns" {
  name                = "ch01-three-tier-setup-ehns"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
  capacity            = 1
}

resource "azurerm_eventhub" "eventhub" {
  name                = "ch01-three-tier-setup-eh"
  namespace_name      = azurerm_eventhub_namespace.ehns.name
  resource_group_name = azurerm_resource_group.rg.name
  partition_count     = 1
  message_retention   = 1
}

resource "azurerm_storage_account" "sto_acc_eh" {
  name                              = "ehubcapstorage"
  resource_group_name               = azurerm_resource_group.rg.name
  location                          = azurerm_resource_group.rg.location
  account_tier                      = "Standard"
  account_replication_type          = "LRS"
  enable_https_traffic_only         = true  
  tags                              = {
   Name = "Managed by Terraform"     
  }
}

resource "azurerm_storage_container" "ehc" {
  name                  = "ehubmessages"
  storage_account_name  = azurerm_storage_account.sto_acc_eh.name
  container_access_type = "private"
}

resource "azurerm_storage_table" "nstatus" {
  name                 = "NotificationStatus"
  storage_account_name = azurerm_storage_account.sto_acc_eh.name
}