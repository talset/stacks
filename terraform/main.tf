module "aws-ec2" {
  source = "./module-aws-ec2"
  env      = var.env
  customer = var.customer
  project  = var.project
}
