provider "aws" {
   region     = "ap-south-1"
}

resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_instance" "web" {
  ami                         = var.ami                     
  instance_type               = var.instance_type
  key_name                    = var.key_name
  tags = {
        Name = "Test Games24x7 Server"
    }
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa_key.public_key_openssh
  
  provisioner "local-exec" {
    command = "echo '${tls_private_key.rsa_key.private_key_pem}' > ./'${var.key_name}'.pem"
  }
}
