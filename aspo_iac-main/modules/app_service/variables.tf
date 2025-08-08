variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for the App Service"
}

variable "prefix" {
  type        = string
  description = "Prefix for resource names"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "app_service_plan_id" {
  type        = string
  description = "ID of the App Service Plan"
}

variable "app_insights_key" {
  type        = string
  description = "Application Insights instrumentation key"
  sensitive   = true
}

variable "key_vault_id" {
  type        = string
  description = "ID of the Key Vault"
}