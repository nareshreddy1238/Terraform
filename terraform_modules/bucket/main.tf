resource "aws_s3_bucket" "my_bucket" {
  bucket = "palugulla12389"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}