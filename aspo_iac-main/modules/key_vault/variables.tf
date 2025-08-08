variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for the Key Vault"
}

variable "prefix" {
  type        = string
  description = "Prefix for resource names"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "tenant_id" {
  type        = string
  description = "Azure AD tenant ID"
}

variable "object_id" {
  type        = string
  description = "Azure AD object ID for access policy"
}