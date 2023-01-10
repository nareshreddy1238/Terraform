provider "aws" {
   region     = "ap-south-1"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0cca134ec43cf708f"
    instance_type = "t2.micro"
    tags = {
      Name = "Test Instance 1"
    }
}

terraform {
    backend "s3" {
        bucket = "intel-ban-terraform-state-lock"
        key    = "terraform/remote/s3/terraform.tfstate"
        region     = "ap-south-1"
       dynamodb_table  = "dynamodb-state-locking"
    }
} 
