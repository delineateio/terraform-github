locals {
  repos = ["terraform-github"]
}

module "repos" {
  for_each = toset(local.repos)
  source   = "./modules/repo"

  name        = each.key
  description = ""
}
