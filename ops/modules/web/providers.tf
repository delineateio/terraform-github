terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    vercel = {
      source = "vercel/vercel"
    }
  }
  experiments = [module_variable_optional_attrs]
}
