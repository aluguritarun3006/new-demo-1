resource "aws_s3_bucket" "unrestricted" {
  bucket = "examplebuckettftest"
  #zpc-skip-policy: ZS-AWS-00034:testing
  acl    = "private"
  versioning {
    enabled = true
    mfa_delete = true
  }
  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
    }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}
