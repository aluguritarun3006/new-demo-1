resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  tags = {
    Name        = "My bucket tarun"
    Environment = "Dev"
  }
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}

resource "aws_s3_bucket" "b2" {
  bucket = "my-tf-test-bucket2"

  tags = {
    Name        = "My bucket tarun"
    Environment = "Dev"
  }
  versioning {
    enabled = true
  }
}
