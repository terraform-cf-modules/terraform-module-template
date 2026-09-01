# Wrapper

Creates many instances of the root module from a single map, so a list of similar resources does not need a
repeated `module` block per item.

```hcl
module "instances" {
  source = "terraform-cf-modules/{{MODULE_REGISTRY_NAME}}/cloudflare//wrappers"

  defaults = {
    account_id = var.account_id
  }

  items = {
    first  = { zone_id = var.zone_a }
    second = { zone_id = var.zone_b, enabled = false }
  }
}
```

Keys in `items` become the state addresses, so keep them stable. Renaming a key destroys and recreates that
instance.

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
