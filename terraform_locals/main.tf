provider "aws" {
   region     = "ap-south-1"
}
locals {
  staging_env = "staging"
}
resource "aws_vpc" "staging-vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "${local.staging_env}-vpc"
  }
}
resource "aws_subnet" "staging-subnet" {
  vpc_id = aws_vpc.staging-vpc.id
  cidr_block = "192.168.1.0/24"
  tags = {
    Name = "${local.staging_env}-subnet"
  }
}
resource "aws_instance" "ec2_example" {
   ami           = "ami-0763cf792771fe1bd"
   instance_type = "t2.micro"
   subnet_id = aws_subnet.staging-subnet.id
   tags = {
           Name = "${local.staging_env} - Instance"
   }
}
