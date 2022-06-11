terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }

  experiments = [module_variable_optional_attrs]
}
