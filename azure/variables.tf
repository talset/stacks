# Azure
variable "azure_client_id" {
  description = "Azure client ID to use."
}

variable "azure_client_secret" {
  description = "Azure client Secret to use."
}

variable "azure_subscription_id" {
  description = "Azure subscription ID to use."
}

variable "azure_tenant_id" {
  description = "Azure tenant ID to use."
}

variable "azure_env" {
  description = "Azure environment to use. Can be either `public`, `usgovernment`, `german` or `china`."
  default     = "public"
}

variable "azure_location" {
  description = "Azure location to use."
  default     = "francecentral"
}

variable "project" {
  default     = "snowy"
}

variable "env" {
  default     = "demo"
}

variable "customer" {
  default     = "cycloid"
}
variable "git_code_commit" {
  default = "53f864ee253e19caff4cec8c9edd1c35e962c034"
}
variable "git_code_repo" {
  default = "https://github.com/talset/stacks"
}
