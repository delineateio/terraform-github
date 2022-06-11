output "context" {
  value = var.context
}

output "repo_full_name" {
  value       = module.repo.full_name
  description = "The full name of the repository as 'owner/name'."
}

output "repo_html_url" {
  value       = module.repo.html_url
  description = "The URL to open the repository on the web."
}

output "repo_branches" {
  value       = module.repo.branches
  description = "List of the branches for the repo."
}
