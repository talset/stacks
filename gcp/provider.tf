variable "customer" {}
variable "project" {}
variable "env" {}

variable "git_code_commit" {
  default = "origin/code"
}
variable "git_code_repo" {
  default = "https://github.com/talset/stacks"
}

provider "google" {
  version = "~> 2.18.0"
  project = var.gcp_project
}
variable "gcp_project" {
default = "cycloid-demo"
}
variable "gcp_zone" {
default = "europe-west1-b"
}
