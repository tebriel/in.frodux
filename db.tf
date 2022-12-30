variable "postgres_admin_username" {
  type = string
}
variable "postgres_admin_password" {
  type = string
}

resource "azurerm_postgresql_flexible_server" "db" {
  name                   = "frodux-infra"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  version                = "14"
  administrator_login    = var.postgres_admin_username
  administrator_password = var.postgres_admin_password

  storage_mb = 32768

  sku_name = "B_Standard_B1ms"
}

resource "azurerm_postgresql_flexible_server_database" "bookwyrm" {
  name      = "bookwyrm"
  server_id = azurerm_postgresql_flexible_server.db.id
  collation = "en_US.utf8"
  charset   = "utf8"
}
