data "aws_elb_service_account" "main" {}

resource "aws_kms_key" "test_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "elb_logs" {
  bucket = "terraform-test-bucket-peyton"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.test_key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}