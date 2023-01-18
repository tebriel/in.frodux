data "azurerm_resource_group" "frodux-in" {
  name = "frodux.in"
}
data "azurerm_dns_zone" "frodux" {
  name = "frodux.in"
}

data "azurerm_dns_zone" "pindropt-fail" {
  name = "pindropt.fail"
}

resource "azurerm_dns_a_record" "bookwyrm" {
  name                = "bookwyrm"
  zone_name           = data.azurerm_dns_zone.frodux.name
  resource_group_name = data.azurerm_resource_group.frodux-in.name
  ttl                 = 300
  records             = ["13.85.184.208"]
}

resource "azurerm_dns_a_record" "takahe" {
  name                = "takahe"
  zone_name           = data.azurerm_dns_zone.pindropt-fail.name
  resource_group_name = data.azurerm_resource_group.frodux-in.name
  ttl                 = 300
  records             = ["13.85.184.208"]
}
