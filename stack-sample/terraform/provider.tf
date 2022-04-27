variable "customer" {}
variable "project" {}
variable "env" {}

variable "git_code_commit" {
  default = "origin/code"
}
variable "git_code_repo" {
  default = "https://github.com/cycloid-community-catalog/docs-step-by-step-stack.git"
}

# Aws
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.aws_region
}
variable "access_key" {}
variable "secret_key" {}
variable "aws_region" {}
