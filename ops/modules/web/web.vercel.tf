locals {
  # indicates if vercel is hosting platform
  is_vercel = lower(var.web.web_type) == "vercel" ? true : false
  # gets the full repo name
  vercel_repo = "${var.context.owner}/${var.context.name}"
  # gets the website domain mapping
  vercel_mappings = local.is_vercel ? { for key, value in var.context.extensions :
    "${var.context.name}.${var.context.basename}.${key}" => value.branch
    if value.type == "website"
  } : {}
}

resource "vercel_project" "this" {
  count     = local.is_vercel ? 1 : 0
  name      = var.context.name
  framework = var.web.web_info["framework"]
  team_id   = var.web.web_info["team_id"]
  git_repository = {
    type = "github"
    repo = local.vercel_repo
  }
}

resource "vercel_project_domain" "this" {
  for_each   = local.vercel_mappings
  project_id = vercel_project.this[0].id
  team_id    = var.web.web_info["team_id"]
  domain     = each.key
  git_branch = each.value
}

resource "vercel_deployment" "this" {
  count      = local.is_vercel ? 1 : 0
  project_id = vercel_project.this[0].id
  team_id    = var.web.web_info["team_id"]
  ref        = var.sha
}
