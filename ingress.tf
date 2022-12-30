data "azurerm_dns_zone" "frodux" {
  name = "frodux.in"
}

resource "azurerm_dns_a_record" "bookwyrm" {
  name                = "bookwyrm"
  zone_name           = data.azurerm_dns_zone.frodux.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 300
  records             = ["13.85.184.208"]
}
