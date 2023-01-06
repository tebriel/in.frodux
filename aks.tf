resource "azurerm_kubernetes_cluster" "aks" {
  name                          = "in-frodux-infra"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  dns_prefix                    = "in-frodux-infra-dns"
  automatic_channel_upgrade     = "patch"
  public_network_access_enabled = true
  sku_tier                      = "Free"
  local_account_disabled        = false
  node_resource_group           = azurerm_resource_group.nodes.name
  oidc_issuer_enabled           = false
  open_service_mesh_enabled     = false

  default_node_pool {
    name                = "agentpool"
    node_count          = 1
    min_count           = 1
    max_count           = 4
    vm_size             = "Standard_B2ms"
    enable_auto_scaling = true
    os_sku              = "Ubuntu"

    custom_ca_trust_enabled      = false
    enable_host_encryption       = false
    enable_node_public_ip        = false
    fips_enabled                 = false
    node_taints                  = []
    only_critical_addons_enabled = false
  }

  identity {
    type         = "SystemAssigned"
    identity_ids = []
  }
  network_profile {
    network_plugin     = "kubenet"
    load_balancer_sku  = "standard"
    dns_service_ip     = "10.0.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
    ip_versions        = ["IPv4"]
    pod_cidr           = "10.244.0.0/16"
    pod_cidrs          = ["10.244.0.0/16"]
    service_cidr       = "10.0.0.0/16"
    service_cidrs      = ["10.0.0.0/16"]
  }

  azure_policy_enabled             = false
  http_application_routing_enabled = false
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
