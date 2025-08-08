terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
  source  = "hashicorp/azurerm"
  version = "~> 4.35"
  }

azuread = {
  source  = "hashicorp/azuread"
  version = "~> 3.4"
  }

random = {
  source  = "hashicorp/random"
  version = "~> 3.7"
  }
  }
}

provider "azurerm" {
  features {}
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

provider "azuread" {}

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-rg-${var.environment}"
  location = var.location
}

#resource "azurerm_virtual_network" "main" {
#  name                = "${var.prefix}-vnet-${var.environment}"
#  resource_group_name = azurerm_resource_group.main.name
#  location            = azurerm_resource_group.main.location
#  address_space       = ["10.0.0.0/16"]
#}

#resource "azurerm_subnet" "private_endpoints" {
#  name                 = "${var.prefix}-subnet-private-${var.environment}"
#  resource_group_name  = azurerm_resource_group.main.name
# virtual_network_name = azurerm_virtual_network.main.name
# address_prefixes     = ["10.0.1.0/24"]
#}

#module "acr" {
#  source              = "./modules/acr"
#  resource_group_name = azurerm_resource_group.main.name
#  location            = azurerm_resource_group.main.location
#  prefix              = var.prefix
#  environment         = var.environment
#}

#module "app_service_plan" {
#  source              = "./modules/app_service_plan"
#  resource_group_name = azurerm_resource_group.main.name
#  location            = azurerm_resource_group.main.location
#  prefix              = var.prefix
#  environment         = var.environment
#}

#module "app_service" {
#  source                = "./modules/app_service"
#  resource_group_name   = azurerm_resource_group.main.name
#  location              = azurerm_resource_group.main.location
#  prefix                = var.prefix
#  environment           = var.environment
#  app_service_plan_id   = module.app_service_plan.id
#  app_insights_key      = module.app_insights.instrumentation_key
#  key_vault_id          = module.key_vault.id
#}

module "static_web_app" {
  source              = "./modules/static_web_app"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  prefix              = var.prefix
  environment         = var.environment
}

#module "cosmosdb_postgresql" {
#  source              = "./modules/cosmosdb_postgresql"
#  resource_group_name = azurerm_resource_group.main.name
#  location            = azurerm_resource_group.main.location
#  prefix              = var.prefix
#  environment         = var.environment
#  subnet_id           = azurerm_subnet.private_endpoints.id
#}

#module "redis_cache" {
#  source              = "./modules/redis_cache"
#  resource_group_name = azurerm_resource_group.main.name
#  location            = azurerm_resource_group.main.location
#  prefix              = var.prefix
#  environment         = var.environment
#  subnet_id           = azurerm_subnet.private_endpoints.id
#}

#module "key_vault" {
#  source              = "./modules/key_vault"
#  resource_group_name = azurerm_resource_group.main.name
#  location            = azurerm_resource_group.main.location
#  prefix              = var.prefix
#  environment         = var.environment
#  tenant_id           = data.azurerm_client_config.current.tenant_id
#  object_id           = data.azurerm_client_config.current.object_id
#}

#module "app_insights" {
#  source              = "./modules/app_insights"
#  resource_group_name = azurerm_resource_group.main.name
#  location            = azurerm_resource_group.main.location
#  prefix              = var.prefix
#  environment         = var.environment
#}

#module "azure_ad_app" {
#  source              = "./modules/azure_ad_app"
#  prefix              = var.prefix
#  environment         = var.environment
#}

data "azurerm_client_config" "current" {}