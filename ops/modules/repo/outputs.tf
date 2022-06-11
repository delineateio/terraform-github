output "full_name" {
  value       = github_repository.this.full_name
  description = "The full name of the repository as 'owner/name'."
}

output "html_url" {
  value       = github_repository.this.html_url
  description = "The URL to open the repository on the web."
}

output "branches" {
  value       = github_repository.this.branches
  description = "List of the branches for the repo."
}
