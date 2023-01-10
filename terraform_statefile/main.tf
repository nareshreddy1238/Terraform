terraform {
  backend "s3" {
    bucket = "palugulla01"
    key = "state/terraform.tfstate"
    region = "ap-south-1"
  }
}

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
