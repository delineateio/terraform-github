locals {
  is_checkly            = lower(var.health.health_type) == "checkly" ? true : false
  checkly_health_checks = local.is_checkly ? local.health_checks : {}
  checkly_dashboard_url = "${var.context.name}-${var.context.owner}"
}

resource "checkly_dashboard" "this" {
  count           = local.is_checkly ? 1 : 0
  custom_url      = local.checkly_dashboard_url
  custom_domain   = "${var.context.name}.${var.context.basename}.${var.health.tld}"
  logo            = var.health.health_dashboard.logo_url
  header          = var.context.name
  refresh_rate    = 60
  paginate        = false
  pagination_rate = 30
  hide_tags       = false
  width           = "FULL"
  tags            = [var.context.name]
}

resource "checkly_check" "this" {
  for_each                  = local.checkly_health_checks
  name                      = each.key
  type                      = "BROWSER"
  activated                 = true
  should_fail               = false
  frequency                 = each.value.frequency
  double_check              = true
  ssl_check                 = true
  use_global_alert_settings = true
  locations                 = each.value.locations
  runtime_id                = each.value.settings["runtime"]

  script = templatefile("${path.module}/checkly.tpl", {
    check_url = "https://${var.context.name}.${var.context.basename}.${each.value.tld}" }
  )
  tags = [var.context.name]
}
