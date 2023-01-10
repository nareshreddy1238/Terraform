provider "aws" {
   region     = "ap-south-1"
}

resource "aws_instance" "test_example" {
   ami           = "ami-0cca134ec43cf708f"
   instance_type =  var.instance_type
   tags = {
           Name = "Test Instance"
   }
}

