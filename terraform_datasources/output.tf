output "get_info_from_aws" {
  value = data.aws_instance.my_instance.public_ip
}

output "mybucket" {
  value = data.aws_s3_bucket.s3_bucket.bucket
}