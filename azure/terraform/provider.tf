variable "customer" {}
variable "project" {}
variable "env" {}

variable "git_code_commit" {
  default = "origin/code"
}
variable "git_code_repo" {
  default = "https://github.com/talset/stacks"
}

# Azure
provider "azurerm" {
  version = "~> 1.42.0"

  environment     = var.azure_env
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
}

# Azure
variable "azure_client_id" {}

variable "azure_client_secret" {}

variable "azure_subscription_id" {}

variable "azure_tenant_id" {}

variable "azure_env" {
  default = "public"
}

variable "azure_location" {
  default = "francecentral"
}
variable "azure_resource_group" {
  default = "cycloid-demo"
}
variable "azure_subnet_id" {
}
