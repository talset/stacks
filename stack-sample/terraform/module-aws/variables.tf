data "aws_region" "current" {}

variable "env" {}
variable "customer" {}

variable "keypair_name" {
  default = "demo"
}

variable "project" {
  default = "cycloid"
}

variable "instance_type" {
  default = "t3.small"
}

variable "git_code_commit" {}
variable "git_code_repo" {}
