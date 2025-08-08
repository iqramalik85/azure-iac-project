resource "azurerm_redis_cache" "main" {
  name                          = "${var.prefix}-redis-${var.environment}"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  capacity                      = 0 # smallest (250MB for Basic C0)
  family                        = "C"
  sku_name                      = "Basic"
  non_ssl_port_enabled          = false
  minimum_tls_version           = "1.2"
  public_network_access_enabled = false
}

resource "azurerm_private_endpoint" "redis" {
  name                = "${var.prefix}-redis-endpoint-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.prefix}-redis-connection-${var.environment}"
    private_connection_resource_id = azurerm_redis_cache.main.id
    subresource_names              = ["redisCache"]
    is_manual_connection           = false
  }
}