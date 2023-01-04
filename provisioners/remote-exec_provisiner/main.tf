provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "webserver" {
    ami                         = "ami-0cca134ec43cf708f"                      
    instance_type               = "t2.micro" 
    key_name                    = "local"
    vpc_security_group_ids      = [aws_security_group.ssh_sg_test.id]

  connection {
      type        = "ssh"
      host        = aws_instance.webserver.public_ip
      user        = "ec2-user"
      private_key = file("C:/Users/nares/Downloads/local.pem")
      timeout     = "4m"
   }  
  
  provisioner "file" {
    source      = "httpd.sh"
    destination = "/tmp/httpd.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/httpd.sh",
      "sh /tmp/httpd.sh",
    ]
  }
}
resource "aws_security_group" "ssh_sg_test" {
  name        = "SSH"
  description = "Allow SSH traffic"
  ingress {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }
}