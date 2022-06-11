locals {
  default_privacy = "closed"
  team_prefix     = lower("${var.context.owner}-${var.context.name}")
  team_name       = lower("${local.team_prefix}-${var.team_name}")
}

data "github_team" "this" {
  slug = var.context.owner
}

resource "github_team" "this" {
  name           = local.team_name
  description    = "${title(var.team_name)} for '${var.context.owner}/${var.context.name}'"
  privacy        = local.default_privacy
  parent_team_id = data.github_team.this.id
}

resource "github_team_members" "this" {
  for_each = toset(var.usernames)
  team_id  = github_team.this.id

  members {
    username = each.key
    role     = var.role
  }
}
