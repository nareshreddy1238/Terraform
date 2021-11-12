provider "aws" {
  region  = var.region
}

resource "aws_instance" "webserver" {
  count = 2  ################ create the multiple servers #################
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet
  security_groups = ["${var.sec_grp}"]
  key_name      = var.key_name
  
  tags = {
    Name = "Web Server-${count.index+1}"
 }
}

