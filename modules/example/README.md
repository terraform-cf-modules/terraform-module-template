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
## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether to create the resources managed by this submodule. | `bool` | `true` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | Cloudflare zone ID that owns the resources. | `string` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_enabled"></a> [enabled](#output\_enabled) | Whether this submodule created its resources. |
<!-- END_TF_DOCS -->
