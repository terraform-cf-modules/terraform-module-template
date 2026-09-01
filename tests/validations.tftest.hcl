# Input validation. Plan only, no credentials.

mock_provider "cloudflare" {
}

run "rejects_malformed_account_id" {
  command = plan

  variables {
    account_id = "not-a-valid-account-id"
  }

  expect_failures = [var.account_id]
}

run "rejects_malformed_zone_id" {
  command = plan

  variables {
    zone_id = "TOO-SHORT"
  }

  expect_failures = [var.zone_id]
}
