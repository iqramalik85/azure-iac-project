variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for the Redis Cache"
}

variable "prefix" {
  type        = string
  description = "Prefix for resource names"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "subnet_id" {
  description = "Subnet ID for private endpoint"
  type        = string
}