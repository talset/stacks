module "instance" {
  source = "./module-gcp"
  project  = var.project
  env      = var.env
  customer = var.customer

  git_code_commit = var.git_code_commit
  git_code_repo = var.git_code_repo
  gcp_zone = var.gcp_zone
  gcp_project  = var.gcp_project
}
