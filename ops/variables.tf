variable "context" {
  type = object({
    owner    = string
    name     = string
    basename = string
    extensions = map(object({
      type   = string
      value  = string
      branch = optional(string)
    }))
  })
}

variable "repo" {
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
      role      = string
      usernames = list(string)
    })),
  })
}

variable "web" {
  type = object({
    web_type = string
    web_info = map(string)
  })
}

variable "health" {
  type = object({
    health_type = string
    health_dashboard = object({
      logo_url = string
    })
    health_checks = list(object({
      prefix    = string
      tld       = string
      frequency = number
      locations = list(string)
      settings  = optional(map(string))
    }))
    tld = string
  })
}
