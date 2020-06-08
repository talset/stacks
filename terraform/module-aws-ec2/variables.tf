data "aws_region" "current" {}

variable "env" {}
variable "customer" {}

variable "keypair_name" {
  default = "demo"
}

variable "project" {
  default = "aws-ec2"
}

variable "front_type" {
  default = "t3.small"
}
