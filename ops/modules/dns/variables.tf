variable "type" {
  description = "DNS details for the records to be created."
  type        = string
  validation {
    condition     = lower(var.type) == "cloudflare"
    error_message = "Only Cloudflare is currently supported for DNS management."
  }
}

variable "context" {
  type = object({
    owner    = string
    name     = string
    basename = string
    extensions = map(object({
      value  = string
      branch = optional(string)
    }))
  })
}
