module "eks" {
  source = "./module-dummy"
}

module "aws-load-balancer-controller" {
  source = "./module-dummy"

  depends_on = [
    time_sleep.wait_eks_destroy
  ]
}

module "ingress-nginx" {
  source = "./module-dummy"
  depends_on = [
    module.aws-load-balancer-controller
  ]
}

module "ebs-csi-driver" {
  source = "./module-dummy"
}

module "fluent-bit" {
  source = "./module-dummy"
}

module "cert-manager" {
  source = "./module-dummy"
  depends_on = [
    module.eks
  ]
}


module "monitoring" {
  source = "./module-dummy"

  # prometheus_enabled = false
  depends_on = [
    time_sleep.wait_ebs_destroy,
    time_sleep.wait_ingress
  ]
}
