resource "tfe_workspace" "encryption_check" {
  name         = "encryption-check"
  organization = var.organization

  execution_mode = "remote"
}

resource "tfe_workspace" "iam-role-check" {
  name         = "iam-role-check"
  organization = var.organization

  execution_mode = "remote"
}

resource "tfe_workspace" "lb-logging-check" {
  name         = "lb-logging-check"
  organization = var.organization

  execution_mode = "remote"
}

resource "tfe_workspace" "tag-check" {
  name         = "tag-check"
  organization = var.organization

  execution_mode = "remote"
}