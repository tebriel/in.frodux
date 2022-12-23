resource "azurerm_kubernetes_cluster" "aks" {
  name                            = "in-frodux-infra"
  location                        = azurerm_resource_group.rg.location
  resource_group_name             = azurerm_resource_group.rg.name
  dns_prefix                      = "infra"
  automatic_channel_upgrade       = "patch"
  public_network_access_enabled   = true
  api_server_authorized_ip_ranges = ["0.0.0.0/32"]
  sku_tier                        = "Free"

  default_node_pool {
    name                = "default"
    node_count          = 1
    vm_size             = "Standard_B2ms"
    enable_auto_scaling = false
    os_sku              = "Ubuntu"
  }

  linux_profile {
    admin_username = "tebriel"
    ssh_key {
      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCV5VtRYn2N8LY021ctMQj7nk1aUu51iGlRPEHCiJAFTT/wyVS3eA43Lhoup+UhQe3KqhTOA6zxUyq4dgivLTLm8+qWsm4FFoDvgK73fKNQh+TrUwY7507imIhwYmYLfiSN7aB5ksMgPhX/cZSl8OIaimjNdIRBEMEEUErhDh52NKvcuaCECNrDHhEse6O46HW9hQOQ3jxQ6J05NbVAgJefGPH4t+GqItrq9ZEhWnciFnlo/PFIQiyYOliLvkEFzQ8I+njecl4/SsR7pPs9Ve3fMncWqSqSRJm0APvHk/zoMp3B+KT6IjIdocnTu0JDtoi/FwNIfAlECHnYfx3FsacNO9qlDr0kYFtIzuXPvT1khclcaZlYPuq2PVX4eywvCH2uYsT3GZqbfOpwDOL3PDhVjGDN6UD5drJotUh29NTzy7ALAN8RTr/Am2PsjjngV0rzADkSwBW50dihgj5fxyuTFtHY/UpwYg2mFK24v1W7zlXkRVuRdDDZddMgG3cxe/DSN8EkEP1yyvwzlAAfFsfTh87Bd+egmWWVxhmmJk4cENngv9+5fPgVz8CDvcbPouTdRrTcVy1uMjo1YcQrBHaOlwL90ivrAtxPZ6xsZfpOBvLJoW+Iae22rTVrIIPCpgUFXKLLZ85VbE+zof2qoMAA7lIogvzXNEKdmunCp0HOKw=="
    }
  }

  identity {
    type = "SystemAssigned"
  }

  aci_connector_linux {
    subnet_name = azurerm_subnet.virtual.name
  }
}