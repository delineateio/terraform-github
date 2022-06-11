terraform {
  required_providers {
    checkly = {
      source = "checkly/checkly"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }

  experiments = [module_variable_optional_attrs]
}
