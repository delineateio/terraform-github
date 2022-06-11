variable "context" {
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
  type = object({
    web_type = string
    web_info = map(string)
  })
}
