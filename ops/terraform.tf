terraform {
  required_version = ">= 1.1.2, < 2.0.0"

  cloud {
    organization = "delineateio"

    workspaces {
      name = "terraform-github"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.26.1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0, < 4.0.0"
    }
  }
}

provider "github" {}
