# Submodule: example

Replace this with a description of what the submodule creates.

```hcl
module "example" {
  source  = "terraform-cf-modules/{{MODULE_REGISTRY_NAME}}/cloudflare//modules/example"
  version = "~> 0.1"

  enabled = true
  zone_id = var.zone_id
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
