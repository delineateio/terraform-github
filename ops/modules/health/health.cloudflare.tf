locals {
  is_cloudflare            = lower(var.health.health_type) == "cloudflare" ? true : false
  cloudflare_health_checks = local.is_cloudflare ? local.health_checks : {}
  cloudflare_zone_name     = "${var.context.basename}.${var.health.tld}"
}

data "cloudflare_zone" "this" {
  count = local.is_cloudflare ? 1 : 0
  name  = local.cloudflare_zone_name
}

resource "cloudflare_healthcheck" "this" {
  for_each         = local.cloudflare_health_checks
  name             = each.key
  zone_id          = data.cloudflare_zone.this[0].zone_id
  address          = "${var.context.name}.${var.context.basename}.${each.value.tld}"
  check_regions    = each.value.locations
  type             = "HTTPS"
  port             = "443"
  expected_codes   = ["2xx", "301"]
  follow_redirects = true
  header {
    header = "Host"
    values = [data.cloudflare_zone.this[0].name]
  }
  timeout               = 10
  retries               = 2
  interval              = each.value.frequency
  consecutive_fails     = 3
  consecutive_successes = 2
}
