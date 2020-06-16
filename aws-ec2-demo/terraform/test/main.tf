module "aws-ec2" {
  source   = "./module-aws-ec2"
  env      = var.env
  customer = var.customer
  project  = var.project

  git_code_commit = var.git_code_commit
  git_code_repo   = var.git_code_repo
}
