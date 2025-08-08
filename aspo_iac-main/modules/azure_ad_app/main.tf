resource "azuread_application" "main" {
  display_name = "${var.prefix}-app-${var.environment}"
}

resource "azuread_service_principal" "main" {
  client_id = azuread_application.main.client_id
}

resource "azuread_application_password" "main" {
  application_id = azuread_application.main.id
}