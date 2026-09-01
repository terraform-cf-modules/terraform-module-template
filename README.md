<!-- This file was automatically generated from `README.yaml`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->
<p align="center">
  <img width="1024" height="250" alt="CloudDrove" src="https://clouddrove.s3.ca-central-1.amazonaws.com/Logo/banner.png" />
</p>
<h1 align="center">
    Terraform Cloudflare Module Template
</h1>

<p align="center" style="font-size: 1.2rem;">
    With our comprehensive DevOps toolkit, streamline operations, automate workflows, enhance collaboration and deploy with confidence.
</p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.12.0-green" alt="Terraform">
</a>
<a href="LICENSE">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>
<a href="CHANGELOG.md">
  <img src="https://img.shields.io/badge/Changelog-blue" alt="Changelog">
</a>
<a href="https://github.com/terraform-cf-modules/terraform-module-template/actions/workflows/tf-checks.yml">
  <img src="https://github.com/terraform-cf-modules/terraform-module-template/actions/workflows/tf-checks.yml/badge.svg" alt="tf-checks">
</a>
<a href="https://github.com/terraform-cf-modules/terraform-module-template/actions/workflows/tflint.yml">
  <img src="https://github.com/terraform-cf-modules/terraform-module-template/actions/workflows/tflint.yml/badge.svg" alt="tf-lint">
</a>
<a href="https://github.com/terraform-cf-modules/terraform-module-template/actions/workflows/checkov.yml">
  <img src="https://github.com/terraform-cf-modules/terraform-module-template/actions/workflows/checkov.yml/badge.svg" alt="checkov">
</a>
<a href="https://github.com/terraform-cf-modules/terraform-module-template/actions/workflows/test.yml">
  <img src="https://github.com/terraform-cf-modules/terraform-module-template/actions/workflows/test.yml/badge.svg" alt="test">
</a>

</p>
<hr>


Baseline template for every Terraform module in the terraform-cf-modules organisation.

Copy this repository with the GitHub `Use this template` button, then replace the `{{MODULE_NAME}}`,
`{{MODULE_DESCRIPTION}}` and `{{MODULE_REGISTRY_NAME}}` placeholders.

Every module here targets Cloudflare provider v5. Cloudflare rewrote the provider from its OpenAPI spec in
v5.0.0 and renamed most resources, so verify resource names and attributes against the current provider
documentation rather than from memory or from older examples.


## Prerequisites and Providers

This table contains both Prerequisites and Providers:

| Description | Name | Version |
|-------------|------|---------|
| Prerequisite | Terraform | >= 1.12.0 |
| Prerequisite | OpenTofu | >= 1.12.0 |
| Provider | cloudflare | ~> 5.24 |

---


## 🚀 Usage

### Root module

```hcl
module "example" {
  source  = "terraform-cf-modules/{{MODULE_REGISTRY_NAME}}/cloudflare"
  version = "~> 0.1"

  enabled    = true
  account_id = var.account_id
}
```

### Submodule

```hcl
module "piece" {
  source  = "terraform-cf-modules/{{MODULE_REGISTRY_NAME}}/cloudflare//modules/example"
  version = "~> 0.1"

  enabled = true
  zone_id = var.zone_id
}
```

### Wrapper for many instances

```hcl
module "many" {
  source = "terraform-cf-modules/{{MODULE_REGISTRY_NAME}}/cloudflare//wrappers"

  defaults = {
    account_id = var.account_id
  }

  items = {
    first  = { zone_id = var.zone_a }
    second = { zone_id = var.zone_b }
  }
}
```

---


## 📦 Examples

> ⚠️ **Important:** Avoid using the `main` branch directly, as it may include unstable changes. Always use stable [release versions](https://github.com/terraform-cf-modules/terraform-module-template/releases).

Explore real-world usage scenarios and implementation patterns in the [`examples/`](./examples/) directory.

---


## 📥 Inputs and Outputs

Detailed input variables and output values are documented for easier integration and day-to-day usage.

📘 [View full documentation](docs/io.md)

---


## 📝 Changelog

Track module updates, improvements, and breaking changes across versions.

📌 [View Changelog](CHANGELOG.md)

---


## ✨ Contributors

Big thanks to our contributors for elevating our project with their dedication and expertise!

<div align="center">
  <a href="https://github.com/terraform-cf-modules/terraform-module-template/graphs/contributors" title="Contributors">
    <img src="https://contrib.rocks/image?repo=terraform-cf-modules/terraform-module-template" />
  </a>
</div>

All contributors must follow the [Conventional Commits](https://www.conventionalcommits.org) specification for commit messages.

---


## 🚀 Our Accomplishment

We maintain Terraform modules across AWS, Azure, Google Cloud, DigitalOcean, Hetzner Cloud and Cloudflare 🙌.

- [**Terraform Module Registry**](https://registry.terraform.io/namespaces/terraform-cf-modules): Discover our Cloudflare modules here.
- [**Full module catalog**](https://github.com/clouddrove/toc): Every CloudDrove module and submodule, across every cloud.

---

## Notes

- Do not use the `main` branch for production deployments.
- Always reference a stable version using Git tags or official releases.
- Using tagged versions ensures consistency, stability, and reproducible deployments.

---

## Feedback

Report issues or request features on [GitHub](https://github.com/terraform-cf-modules/terraform-module-template/issues), or write to [business@clouddrove.com](mailto:business@clouddrove.com).

## About us

At [CloudDrove](https://clouddrove.com), we build reliable, secure and cost efficient cloud native solutions. Join our [Slack community](https://www.launchpass.com/devops-talks).
