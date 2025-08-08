variable "prefix" {
  type        = string
  default     = "static-app"
  description = "Prefix for resource names"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name (e.g., dev, prod)"
}

variable "location" {
  type        = string
  default     = "East Asia"
  description = "Azure region for resources"
}

variable "client_id" {
  description = "The Client ID (Application ID) of the Service Principal"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "The Client Secret of the Service Principal"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "The Azure Tenant ID"
  type        = string
}

variable "cosmos_pg_db_name" {
  description = "The PostgreSQL database name in Cosmos DB cluster"
  type        = string
  default     = "test-db"
}