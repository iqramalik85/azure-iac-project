output "application_id" {
  value = azuread_application.main.client_id
}

output "client_secret" {
  value     = azuread_application_password.main.value
  sensitive = true
}