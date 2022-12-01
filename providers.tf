terraform {
  required_providers {
    civo = {
      source = "civo/civo"
      version = "1.0.26"
    }
    
    local = {
      source = "hashicorp/local"
      version = "2.1.0"
    }

    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "civo" {
  token = var.civo_api_key
  region = var.civo_region
}

provider "local" {}

provider "cloudflare" {
  //email   = var.cloudflare_email
  api_token = var.cloudflare_api_token
}