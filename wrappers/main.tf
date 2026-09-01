# -----------------------------------------------------------------------------
# Wrapper: create many instances of the root module from a single map.
#
#   module "zones" {
#     source = "terraform-cf-modules/{{MODULE_REGISTRY_NAME}}/cloudflare//wrappers"
#
#     defaults = {
#       account_id = var.account_id
#     }
#
#     items = {
#       example_com = { zone_name = "example.com" }
#       example_org = { zone_name = "example.org" }
#     }
#   }
# -----------------------------------------------------------------------------

module "wrapper" {
  source = "../"

  for_each = var.items

  enabled    = try(each.value.enabled, var.defaults.enabled, true)
  account_id = try(each.value.account_id, var.defaults.account_id, null)
  zone_id    = try(each.value.zone_id, var.defaults.zone_id, null)
}
