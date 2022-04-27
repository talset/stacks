module "instance" {
  source   = "./module-aws"
  env      = "${var.env}"
  customer = "${var.customer}"
  project  = "${var.project}"

  git_code_commit = "${var.git_code_commit}"
  git_code_repo   = "${var.git_code_repo}"
  instance_type   = "t3.small"

}
