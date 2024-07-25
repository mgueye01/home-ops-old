terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "mgueye01"
    workspaces {
      name = "arpa-home-cloudflare"
    }
  }
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.36.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.3"
    }
  }
  required_version = ">= 1.3.0"
}

module "onepassword_item" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Kubernetes"
  item   = "cloudflare"
}

data "http" "ipv4_lookup_raw" {
  url = "http://ipv4.icanhazip.com"
}

data "cloudflare_zone" "domain" {
  name = "g-eye.io"
}
