module "dns" {
  source = "./modules/dns"

  type    = "cloudflare"
  context = var.context
}

module "repo" {
  source = "./modules/repo"

  context = var.context
  repo    = var.repo
}

module "web" {
  source = "./modules/web"

  context = var.context
  web     = var.web

  depends_on = [module.repo]
}

module "health" {
  source = "./modules/health"

  context = var.context
  health  = var.health

  depends_on = [module.web]
}

# module "health_cloudflare" {
#   source = "./modules/health"

#   context   = var.context
#   type      = "cloudflare"
#   checks    = var.checks

#   depends_on = [module.web]
# }
