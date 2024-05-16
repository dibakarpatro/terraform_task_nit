resource "aws_s3_bucket" "dev" {
  bucket = var.bucketname
}
resource "aws_s3_bucket_ownership_controls" "dev" {
  bucket = aws_s3_bucket.dev.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_public_access_block" "dev" {
  bucket = aws_s3_bucket.dev.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_acl" "dev" {
  depends_on = [
    aws_s3_bucket_ownership_controls.dev,
    aws_s3_bucket_public_access_block.dev,
  ]

  bucket = aws_s3_bucket.dev.id
  acl    = "public-read"
}
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.dev.id
  key    = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}
resource "aws_s3_object" "error" {
    bucket = aws_s3_bucket.dev.id
    key    = "error.html"
    source = "error.html"
    acl = "public-read"
    content_type = "text/html"
  }
  resource "aws_s3_object" "profile" {
    bucket = aws_s3_bucket.dev.id
    key="dibakar.jpg"
    source = "dibakar.jpg"
    acl ="public-read"
  }
  resource "aws_s3_bucket_website_configuration" "dev" {
    bucket = aws_s3_bucket.dev.id
    index_document {
      suffix = "index.html"
    }
    error_document {
      key = "error.html"
    }
    depends_on = [ aws_s3_bucket_acl.dev ]
  }
