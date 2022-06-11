terraform {
  required_version = "1.2.2"

  cloud {
    organization = "delineateio"

    workspaces {
      name = "environments"
    }
  }

  required_providers {
    checkly = {
      source  = "checkly/checkly"
      version = "~> 1.4.3"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.13.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.19.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.24.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.2.2"
    }
    vercel = {
      source  = "vercel/vercel"
      version = "~> 0.6.0"
    }
  }

  experiments = [module_variable_optional_attrs]
}

provider "checkly" {}

provider "cloudflare" {}

provider "digitalocean" {}

provider "github" {}

provider "time" {}

provider "vercel" {}
