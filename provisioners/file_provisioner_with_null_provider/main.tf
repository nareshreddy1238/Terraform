provider "aws" {
    region = "ap-south-1"
}
resource "aws_instance" "web" {
    ami                         = "ami-0cca134ec43cf708f"                      
    instance_type               = "t2.micro" 
    key_name                    = "local"
    user_data                   = "${file("httpd.sh")}"
    vpc_security_group_ids      = [aws_security_group.websg_ssh.id]
    tags = {
        Name = "Test-file-provisioner"
    }
}
resource "null_resource" "copyhtml" {
  connection {
    type = "ssh"
    host = aws_instance.web.public_ip
    user = "ec2-user"
    private_key = file("C:/Users/nares/Downloads/local.pem")
    }
  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.sh"
  }
  provisioner "file" {
    source      = "copy.sh"
    destination = "/tmp/copy.sh"
  }
  depends_on = [ aws_instance.web ]
  }

resource "aws_security_group" "websg_ssh" {
  name        = "websg_ssh"
  description = "Allow ssh inbound traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]   
  }
}