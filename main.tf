# Configuration AWS provider
provider "aws" {
    profile = "default"
    region = "us-east-1"
}

resource "aws_s3_bucket" "tf_s3" {
    bucket = "tf-dbl-20220216"
}
