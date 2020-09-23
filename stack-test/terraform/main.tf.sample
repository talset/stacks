module "ec2" {
  source = "module-ec2"

  env                = "${var.env}"
  project            = "${var.project}"
  customer           = "${var.customer}"
  aws_region         = "${var.aws_region}"

  keypair_name       = "step-by-step"
  public_subnets_ids = "${data.terraform_remote_state.infrastructure.prod_public_subnets_ids}"
  vpc_id             = "${data.terraform_remote_state.infrastructure.prod_vpc_id}"

}

data "terraform_remote_state" "infrastructure" {
  backend = "s3"

  config {
    bucket = "cycloid-terraform-remote-state"
    key    = "infrastructure/infra/infrastructure-infra.tfstate"
    region = "eu-west-1"
  }
}
