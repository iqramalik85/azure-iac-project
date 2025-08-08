resource "azurerm_linux_web_app" "main" {
  name                = "${var.prefix}-app-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.app_service_plan_id

  site_config {
    application_stack {
      python_version = "3.9"
    }
    # Enable always_on only if supported
    always_on = false
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = var.app_insights_key
  }

  identity {
    type = "SystemAssigned"
  }
}
