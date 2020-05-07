provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.aws_region
}

variable "customer" {}
variable "project" {}
variable "env" {}
variable "access_key" {}
variable "secret_key" {}
variable "aws_region" {}

variable "git_code_commit" {
  default = "master"
}
variable "git_code_repo" {
  default = "https://github.com/talset/stacks"
}
