# Configuration AWS provider
provider "aws" {
    profile = "default"
    region = "us-east-1"
}

resource "aws_s3_bucket" "tf_s3" {
    bucket = "tf-dbl-20220216"
}

# Upload an object
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.tf_s3.id
  key    = "profile"
  acl    = "private"  
  source = "files/test.txt"
  etag = filemd5("files/test.txt")
}