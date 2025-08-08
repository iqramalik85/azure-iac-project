resource "azurerm_static_web_app" "main" {
  name                = "${var.prefix}-swa-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_tier            = "Standard"
  sku_size            = "Standard"
}