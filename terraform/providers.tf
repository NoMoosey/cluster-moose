terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.8.0"
    }
  }
}

locals {
  credentials = yamldecode(file("${path.module}/../../configs/proxmox/terraform_credentials.yaml"))
}

provider "proxmox" {
  pm_api_url = "https://10.1.2.221:8006/api2/json"
  pm_api_token_id = local.credentials["id"]
  pm_api_token_secret = local.credentials["secret"]
  pm_timeout = 20000
  pm_tls_insecure = true
}

