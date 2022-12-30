resource "azurerm_resource_group" "rg" {
  name     = "in.frodux.infra"
  location = "South Central US"
}

resource "azurerm_resource_group" "nodes" {
  name     = "in.frodux.infra_aks-infra"
  location = "South Central US"
  tags = {
    "aks-managed-cluster-name" = "in-frodux-infra",
    "aks-managed-cluster-rg"   = "in.frodux.infra",
  }
}
