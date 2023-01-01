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
  #   custom_domain {
  #     name          = "bookwyrm.static.frodux.in"
  #     use_subdomain = true
  #   }
}

# Subdomain validation record
resource "azurerm_dns_cname_record" "storage-cname" {
  name                = "bookwyrm.static"
  zone_name           = data.azurerm_dns_zone.frodux.name
  resource_group_name = data.azurerm_resource_group.frodux-in.name
  ttl                 = 300
  record              = "${local.storage_account_name}.blob.core.windows.net"

  depends_on = [
    azurerm_storage_account.frodux
  ]
}
