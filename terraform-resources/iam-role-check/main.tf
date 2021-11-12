data "aws_caller_identity" "current" {}

resource "aws_iam_role" "example_role" {
  name                = "example_role"
  managed_policy_arns = [aws_iam_policy.policy_one.arn]
  assume_role_policy  = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "policy_one" {
  name = "policy-618033"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["ec2:Describe*"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
  }
}