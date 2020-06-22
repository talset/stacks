module "instance" {
  source = "./module-azure"
  project  = var.project
  env      = var.env
  customer = var.customer

  resource_group_name = "cycloid-demo"
  git_code_commit = var.git_code_commit
  git_code_repo = var.git_code_repo
  azure_location = var.azure_location

}
