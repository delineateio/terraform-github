locals {
  # indicates if digitalocean is hosting platform
  is_digitalocean = lower(var.web.web_type) == "digitalocean" ? true : false
  # gets the full repo name
  digitalocean_repo = "${var.context.owner}/${var.context.name}"
}

resource "digitalocean_app" "this" {
  count = local.is_digitalocean ? 1 : 0
  spec {
    name   = var.context.name
    region = var.web.web_info["region"]

    static_site {
      name          = var.context.name
      build_command = local.build_command

      github {
        repo           = local.digitalocean_repo
        branch         = "main"
        deploy_on_push = true
      }
    }
  }
}
