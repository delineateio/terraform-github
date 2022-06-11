variable "context" {
  description = "Core context to create the environment"
  type = object({
    owner    = string
    name     = string
    basename = string
  })
}

variable "health" {
  description = "The info to create the health checks"
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
