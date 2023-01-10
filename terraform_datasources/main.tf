provider "aws" {
   region     = "ap-south-1"
}

resource "aws_instance" "test_example" {
   ami           = "ami-0cca134ec43cf708f"
   instance_type =  "t2.micro"
  tags = {
           Name = "Test Instance"
   }
}

resource "aws_s3_bucket" "mybucket" {
    bucket = "palugulla12345"
    acl    = "private"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

data "aws_instance" "my_instance" {
    filter {
      name = "tag:Name"
      values = ["Test Instance"]
    }
    depends_on = [
      "aws_instance.test_example"
    ]
}

data "aws_s3_bucket" "s3_bucket" {
    bucket = "palugulla12345"
    depends_on = [
      "aws_s3_bucket.mybucket"
    ]
}