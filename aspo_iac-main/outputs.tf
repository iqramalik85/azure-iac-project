#output "acr_login_server" {
#  value = module.acr.login_server
#}

#output "app_service_hostname" {
#  value = module.app_service.default_hostname
#}

output "static_web_app_hostname" {
  value = module.static_web_app.default_hostname
}

#output "key_vault_uri" {
#  value = module.key_vault.vault_uri
#}

#output "app_insights_instrumentation_key" {
#  value     = module.app_insights.instrumentation_key
#  sensitive = true
#}