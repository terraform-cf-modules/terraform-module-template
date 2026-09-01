# Every optional feature of the {{MODULE_NAME}} module turned on.

provider "cloudflare" {
  # Reads CLOUDFLARE_API_TOKEN from the environment.
}

module "this" {
  source = "../../"

  enabled    = true
  account_id = var.account_id
  zone_id    = var.zone_id
}
