locals {
  storage_account_name = "froduxinfra"
}
resource "azurerm_storage_account" "frodux" {
  name                          = local.storage_account_name
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  account_tier                  = "Standard"
  account_replication_type      = "GRS"
  public_network_access_enabled = true

  blob_properties {
    cors_rule {
      allowed_headers    = ["*"]
      allowed_methods    = ["GET", "HEAD", "POST", "PUT", "DELETE"]
      allowed_origins    = ["https://bookwyrm.frodux.in"]
      exposed_headers    = ["Etag"]
      max_age_in_seconds = 3000
    }
  }
}

resource "azurerm_storage_container" "bookwyrm" {
  name                  = "bookwyrm"
  storage_account_name  = azurerm_storage_account.frodux.name
  container_access_type = "blob"
}
