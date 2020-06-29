module "instance" {
  source   = "./module-azure"
  env      = "${var.env}"
  customer = "${var.customer}"
  project  = "${var.project}"

  git_code_commit = "${var.git_code_commit}"
  git_code_repo   = "${var.git_code_repo}"

  resource_group_name = "${var.azure_resource_group_name}"
  subnet_id           = "/subscriptions/.../subnets/default"
  azure_location      = "${var.azure_location}"
  instance_type       = "Standard_DS1_v2"
}
