locals {
  health_checks = { for check in var.health.health_checks :
  "${check.prefix}.${var.context.name}.${var.context.basename}.${check.tld}" => check }
}
