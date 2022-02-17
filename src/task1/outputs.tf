output "bucket_id" {
  value = aws_s3_bucket.bucket_main.id
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket_main.arn
}

/*
output "logging_target_bucket" {
  value = tolist(aws_s3_bucket.tf_s3.logging)[0].target_bucket
}


output "logging_target_prefix" {
  value = tolist(aws_s3_bucket.tf_s3.logging)[0].target_prefix
}*/