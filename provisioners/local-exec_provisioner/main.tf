provider "aws" {
    region = "ap-south-1"
}
resource "aws_instance" "web" {
    ami                         = "ami-0cca134ec43cf708f"                      
    instance_type               = "t2.micro" 
    key_name                    = "local"
    tags = {
        Name = "Test-local-exec-provisioner"
    }
provisioner "local-exec" {
    command = "echo ${self.private_ip}, ${self.public_ip} >> private_and_public_ips.txt"
  }
}