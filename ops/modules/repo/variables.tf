variable "context" {
  type = object({
    owner    = string
    name     = string
    basename = string
  })
}

variable "repo" {
  description = "Repo details to create."
  type = object({
    description = string
    template = object({
      name  = string
      owner = string
    })
    topics   = list(string)
    settings = map(any)
    teams = list(object({
      name      = string
      usernames = list(string)
      role      = string
    }))
  })
}
