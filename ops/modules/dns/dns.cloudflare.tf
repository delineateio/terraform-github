locals {
  is_cloudflare         = lower(var.type) == "cloudflare" ? true : false
  cloudflare_extensions = local.is_cloudflare ? var.context.extensions : {}
  cloudflare_zones = { for zone in data.cloudflare_zones.this[0].zones :
    zone.name => zone
  }
  cloudflare_type = "CNAME"
  cloudflare_ttl  = 3600
}

data "cloudflare_zones" "this" {
  count = local.is_cloudflare ? 1 : 0
  filter {
    status = "active"
  }
}

resource "cloudflare_record" "this" {
  for_each = local.cloudflare_extensions
  zone_id  = local.cloudflare_zones["${var.context.basename}.${each.key}"].id
  name     = var.context.name
  value    = each.value.value
  type     = local.cloudflare_type
  ttl      = local.cloudflare_ttl
}
