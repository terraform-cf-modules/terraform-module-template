<p align="center">
  <img width="1000" alt="CloudDrove Banner" src="https://clouddrove.s3.ca-central-1.amazonaws.com/img/clouddrove-github-cover.png" />
</p>

<h1 align="center">Terraform Cloudflare Module Template</h1>
<p align="center"><em>Baseline for every module in the terraform-cf-modules organisation.</em></p>

<p align="center">
  <a href="https://www.terraform.io"><img src="https://img.shields.io/badge/terraform-%3E%3D%201.10-844FBA?logo=terraform&logoColor=white" alt="Terraform" /></a>
  <a href="https://opentofu.org"><img src="https://img.shields.io/badge/opentofu-%3E%3D%201.9-FFDA18?logo=opentofu&logoColor=black" alt="OpenTofu" /></a>
  <a href="https://registry.terraform.io/providers/cloudflare/cloudflare/latest"><img src="https://img.shields.io/badge/provider-cloudflare%20~%3E%205.24-F38020?logo=cloudflare&logoColor=white" alt="Cloudflare Provider" /></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" alt="License" /></a>
</p>

---

## Using this template

1. Click **Use this template** on GitHub and name the new repository `terraform-cloudflare-<name>`.

   The repository name matters. The Terraform Registry parses `terraform-<PROVIDER>-<NAME>`, and the provider
   segment becomes the module address. `terraform-cloudflare-workers` publishes as
   `terraform-cf-modules/workers/cloudflare`. A repository named `terraform-cf-workers` would publish as
   `.../workers/cf`, which is wrong and undiscoverable.

2. Replace the placeholders across the repository:

   | Placeholder | Example |
   |-------------|---------|
   | `{{MODULE_NAME}}` | `Cloudflare Workers` |
   | `{{MODULE_REGISTRY_NAME}}` | `workers` |
   | `{{MODULE_DESCRIPTION}}` | `Workers, routes, cron triggers, and storage bindings.` |

   ```bash
   grep -rl '{{MODULE_' . --exclude-dir=.git | xargs sed -i '' \
     -e 's/{{MODULE_NAME}}/Cloudflare Workers/g' \
     -e 's/{{MODULE_REGISTRY_NAME}}/workers/g'
   ```

3. Build the root module in `main.tf`, the building blocks under `modules/`, and delete `modules/example`.
4. Write `examples/basic` and `examples/complete`, plus a feature specific example for anything non obvious.
5. Run `make ci`, commit with a Conventional Commit title, and open a pull request.

---

## Repository layout

```
terraform.tf          provider and version requirements
main.tf               root module resources
variables.tf          root module inputs
outputs.tf            root module outputs
locals.tf             locals
modules/<name>/       composable building blocks, same file layout
examples/basic/       minimum viable example
examples/complete/    every optional feature turned on
wrappers/             for_each wrapper for many instances
tests/                native terraform test files
docs/                 architecture notes and provider migration guides
```

---

## The rules

Full detail lives in the [organisation contributing guide](https://github.com/terraform-cf-modules/.github/blob/main/CONTRIBUTING.md).
The short version:

- **Product scoped, not resource scoped.** One module maps to a Cloudflare product area. Single resource wrappers
  are not published here.
- **Provider v5 only.** Verify every resource and attribute against the
  [current provider docs](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs). Cloudflare
  renamed most resources in v5.0.0, and older examples (including anything an AI assistant recalls from training
  data) are frequently wrong.
- **`enabled` everywhere**, honoured on every resource.
- **Maps of objects, never lists.** A list reorder destroys and recreates resources. Use `optional()` inside the
  object type and default the map to `{}`.
- **`validation` blocks on every enum.**
- **No `provider` block inside a module.** Authentication belongs to the caller.
- **No credentials as inputs.** Secret outputs are marked `sensitive`.
- **No tagging or labelling convention.** Cloudflare has no general tag surface, so there is deliberately no
  labels module here.

---

## Local development

```bash
pre-commit install

make fmt        # terraform fmt -recursive
make validate   # init and validate every directory
make lint       # tflint
make docs       # regenerate the terraform-docs blocks
make test       # mocked terraform test, no credentials needed
make security   # trivy, checkov, gitleaks
make ci         # all of the above
```

`make test` runs against `mock_provider`, so it needs no Cloudflare credentials. The live tests in
`tests/integration.tftest.hcl` run only on schedule and manual dispatch.

---

## CI

Most workflows call the shared, actively maintained
[clouddrove/github-shared-workflows](https://github.com/clouddrove/github-shared-workflows) at `@v2`, so the
standard changes in one place for every repository.

| Workflow | Source | Purpose |
|----------|--------|---------|
| `tf-checks` | shared | init and validate both examples |
| `tflint` | shared | lint |
| `checkov` | shared | policy scan |
| `gitleaks` | shared | secret scan |
| `pr_checks` | shared | Conventional Commit pull request title |
| `auto_assignee` | shared | reviewer assignment |
| `automerge` | shared | auto merge on green |
| `stale_pr` | shared | stale handling |
| `readme` | shared | rebuild README from README.yaml |
| `tag-release` | shared | tag and changelog on merge |
| `opentofu` | local | OpenTofu compatibility, no shared equivalent yet |
| `test` | local | `terraform test` with mocked provider |
| `integration` | local | live apply against a test account, scheduled only |

### Required organisation secrets

| Secret | Used by |
|--------|---------|
| `GITHUB` | `tflint`, `tag-release`, `auto_assignee`, `automerge`, `readme` |
| `SLACK_WEBHOOK_TERRAFORM` | `readme` |
| `CLOUDFLARE_API_TOKEN` | `integration` |
| `CLOUDFLARE_TEST_ACCOUNT_ID` | `integration` |
| `CLOUDFLARE_TEST_ZONE_ID` | `integration` |

---

## Inputs and outputs

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

---

## License

Apache 2.0. See [LICENSE](LICENSE).

Maintained by [CloudDrove](https://clouddrove.com) and [Cloud Wizz](https://github.com/cloud-wizz).
