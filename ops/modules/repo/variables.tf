variable "context" {
  description = "Core context to create the environment"
  type = object({
    owner    = string
    name     = string
    basename = string
  })
}

variable "repo" {
  description = "The info to create the source code repo"
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
