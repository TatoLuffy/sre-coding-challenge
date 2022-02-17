# Configuration AWS provider
provider "aws" {
    profile = "default"
    region = "us-east-1"
}

resource "aws_sns_topic" "topic" {
  name = "s3-event-notification-topic"

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[{
        "Effect": "Allow",
        "Principal": { "Service": "s3.amazonaws.com" },
        "Action": "SNS:Publish",
        "Resource": "arn:aws:sns:*:*:s3-event-notification-topic",
        "Condition":{
            "ArnLike":{"aws:SourceArn":"${aws_s3_bucket.tf_s3.arn}"}
        }
    }]
}
POLICY
}

resource "aws_s3_bucket" "tf_s3" {
    bucket = "tf-dbl-20220216"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.tf_s3.id

  topic {
    topic_arn     = aws_sns_topic.topic.arn
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".log"
  }
}

# Upload an object
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.tf_s3.id
  key    = "profile"
  acl    = "private"  
  source = "files/test.txt"
  etag = filemd5("files/test.txt")
}