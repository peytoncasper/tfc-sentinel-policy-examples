resource "tfe_sentinel_policy" "encryption-check" {
  name         = "s3-encryption-check"
  description  = "This policy checks for KMS configuration on S3 buckets"
  organization = var.organization
  policy       = file("../sentinel-policies/encryption-check/encryption-check.sentinel")
  enforce_mode = "hard-mandatory"
}

resource "tfe_sentinel_policy" "iam-role-check" {
  name         = "iam-role-check"
  description  = "This policy checks a default IAM policy ARN to be attached to roles"
  organization = var.organization
  policy       = file("../sentinel-policies/iam-role-check/iam-role-check.sentinel")
  enforce_mode = "soft-mandatory"
}

resource "tfe_sentinel_policy" "lb-loggin-check" {
  name         = "lb-loggin-check"
  description  = "This policy checks for access logging configuration to be provided on any ELBs"
  organization = var.organization
  policy       = file("../sentinel-policies/lb-logging-check/lb-logging-check.sentinel")
  enforce_mode = "soft-mandatory"
}

resource "tfe_sentinel_policy" "tag-check" {
  name         = "tag-check"
  description  = "This policy checks for environment tags to exist on any resource"
  organization = var.organization
  policy       = file("../sentinel-policies/tag-check/tag-check.sentinel")
  enforce_mode = "advisory"
}

resource "tfe_policy_set" "policy-set" {
  name          = "policy-set"
  description   = "Contains tag check, lb logging, s3 encryption and default IAM policy checks"
  organization  = var.organization
  policy_ids    = [
      tfe_sentinel_policy.tag-check.id, 
      tfe_sentinel_policy.lb-loggin-check.id, 
      tfe_sentinel_policy.iam-role-check.id,
      tfe_sentinel_policy.encryption-check.id
    ]
  workspace_ids = [
      tfe_workspace.tag-check.id,
      tfe_workspace.lb-logging-check.id,
      tfe_workspace.iam-role-check.id,
      tfe_workspace.encryption_check.id
      ]
}