variable "app_cronjobs" {
}

locals {
  app_cronjobs = <<EOL
---
app:
  cronjobs:
    ${indent(4, yamlencode(var.app_cronjobs))}
 EOL
}

output "cron" {
  value = local.app_cronjobs
}
