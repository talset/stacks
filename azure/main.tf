module "instance" {

  #####################################
  # Do not modify the following lines #
  source = "./module-azure"

  project  = var.project
  env      = var.env
  customer = var.customer
  #####################################

  resource_group_name = "cycloid-demo"
  git_code_commit = var.git_code_commit
  git_code_repo = var.git_code_repo

}
