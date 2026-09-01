# Applies against a real Cloudflare test account.
# Runs on a schedule and on manual dispatch only, never on pull requests,
# because fork pull requests cannot read organisation secrets.

variables {
  account_id = null # supplied by TF_VAR_account_id
  zone_id    = null # supplied by TF_VAR_zone_id
}

run "apply_and_destroy" {
  command = apply

  assert {
    condition     = output.enabled == true
    error_message = "Module did not report enabled after apply."
  }
}
