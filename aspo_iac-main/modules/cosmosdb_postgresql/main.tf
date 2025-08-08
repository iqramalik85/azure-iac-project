resource "azurerm_cosmosdb_postgresql_cluster" "main" {
  name                            = "${var.prefix}-cosmos-pg-${var.environment}"
  resource_group_name             = var.resource_group_name
  location                        = var.location

  coordinator_storage_quota_in_mb = 131072
  node_count                      = 0       
  coordinator_vcore_count         = 2        
  administrator_login_password    = random_password.cosmos_password.result
}

resource "random_password" "cosmos_password" {
  length  = 16
  special = true
}

# Only create private endpoint if subnet_id is provided (optional)
resource "azurerm_private_endpoint" "cosmos" { 
  name                = "${var.prefix}-cosmos-endpoint-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.prefix}-cosmos-connection-${var.environment}"
    private_connection_resource_id = azurerm_cosmosdb_postgresql_cluster.main.id
    subresource_names              = ["coordinator"]
    is_manual_connection           = false
  }
}