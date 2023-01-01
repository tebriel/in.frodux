resource "azurerm_storage_account" "frodux" {
  name                          = "froduxinfra"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  account_tier                  = "Standard"
  account_replication_type      = "GRS"
  public_network_access_enabled = true
}
