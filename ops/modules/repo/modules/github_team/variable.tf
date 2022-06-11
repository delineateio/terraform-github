variable "context" {
  type = object({
    owner    = string
    name     = string
    basename = string
  })
}

variable "team_name" {
  type = string
}

variable "usernames" {
  type = list(string)
}

variable "role" {
  type = string
}
