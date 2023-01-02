provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "web" {
    ami                         = "ami-0763cf792771fe1bd"                       
    instance_type               = var.instance_type 
    tags = {
        Name = "WebServer"
    }      
}
