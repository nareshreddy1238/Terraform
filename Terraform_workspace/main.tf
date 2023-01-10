provider "aws" {
   region     = "ap-south-1"
}
locals {
  instance_name = "${terraform.workspace}-instance" 
}
resource "aws_instance" "ec2_example" {
    ami = "ami-0763cf792771fe1bd" 
    instance_type = var.instance_type
    tags = {
      Name = local.instance_name
      env = var.env_name
    }
}