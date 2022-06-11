variable "context" {
  type = object({
    owner    = string
    name     = string
    basename = string
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
