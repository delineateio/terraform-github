variable "context" {
  description = "Core context to create the environment"
  type = object({
    owner    = string
    name     = string
    basename = string
    extensions = map(object({
      branch = optional(string)
      type   = string
    }))
  })
}

variable "web" {
  description = "The info to create the website"
  type = object({
    web_type = string
    web_info = map(string)
  })
}

variable "sha" {
  description = "The HEAD sha to deploy"
  type        = string
}
