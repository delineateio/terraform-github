locals {
  github_visibility = "public"
  github_pattern    = "main"
  github_teams = {
    for team in var.repo.teams :
    team.name => team
  }
  github_topics = toset([for topic in var.repo.topics : lower(topic)])
}

resource "github_repository" "this" {
  name                   = var.context.name
  description            = var.repo.description
  visibility             = local.github_visibility
  has_issues             = false
  is_template            = false
  delete_branch_on_merge = true
  has_downloads          = false
  auto_init              = true
  vulnerability_alerts   = true
  topics                 = local.github_topics
  template {
    owner      = var.repo.template.owner
    repository = var.repo.template.name
  }
}

data "github_team" "this" {
  slug = var.repo.settings["collaborator"]
}

resource "github_team_repository" "this" {
  team_id    = data.github_team.this.id
  repository = github_repository.this.name
  permission = var.repo.settings["permission"]
}

resource "github_branch_protection" "this" {

  repository_id           = github_repository.this.node_id
  pattern                 = local.github_pattern
  enforce_admins          = true
  require_signed_commits  = true
  required_linear_history = true
  allows_deletions        = true
  allows_force_pushes     = false

  required_status_checks {
    strict   = true
    contexts = null
  }

  required_pull_request_reviews {
    dismiss_stale_reviews  = true
    restrict_dismissals    = true
    dismissal_restrictions = null
    pull_request_bypassers = null
  }
}

module "teams" {
  for_each = local.github_teams
  source   = "./modules/github_team"

  context   = var.context
  team_name = each.value.name
  role      = each.value.role
  usernames = each.value.usernames
}
