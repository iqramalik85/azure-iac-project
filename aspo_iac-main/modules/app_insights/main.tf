resource "azurerm_application_insights" "main" {
  name                = "${var.prefix}-appinsights-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location
  application_type    = "web"
  retention_in_days   = 30             
  daily_data_cap_in_gb = 0.1           
  sampling_percentage  = 100           
  disable_ip_masking   = false         
  internet_ingestion_enabled = true   
  internet_query_enabled     = true   

  workspace_id = null
}