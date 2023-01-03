provider "aws" {
    region = "ap-south-1"
}
resource "aws_instance" "webserver" {
    count = 3
    ami                         = "ami-0763cf792771fe1bd"                       
    instance_type               = "t2.micro"    
    tags = {
        Name = "Web Server ${count.index+1}"
 }    
}

