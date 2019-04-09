variable "env" {}
variable "customer" {}
variable "project" {}

variable "debian_ami_name" {
  default = "debian-stretch-*"
}

variable "instance_type" {
  default = "t3.small"
}

variable "keypair_name" {
  default = "cycloid"
}

variable "public_subnets_ids" {
  type = "list"
}
