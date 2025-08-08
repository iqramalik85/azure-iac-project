resource "azurerm_container_registry" "main" {
  name                          = "${var.prefix}acr${var.environment}"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku                           = "Basic"  # Cheapest SKU
  admin_enabled                 = false
  public_network_access_enabled = true     # Must remain enabled for Basic SKU
}
