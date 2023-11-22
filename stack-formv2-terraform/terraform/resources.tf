resource "time_sleep" "wait_eks_destroy" {
  depends_on       = [module.eks]
  destroy_duration = "3m"
}

resource "time_sleep" "wait_ebs_destroy" {
  depends_on = [module.ebs-csi-driver]
  # create_duration = "30s"
  destroy_duration = "3m"
}

resource "time_sleep" "wait_ingress" {
  depends_on      = [module.ingress-nginx]
  create_duration = "1m"
}
