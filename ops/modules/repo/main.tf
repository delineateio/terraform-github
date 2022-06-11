resource "github_repository" "this" {
  name        = var.name
  description = var.description

  template {
    owner      = "delineateio"
    repository = "oss-template"
  }
}
