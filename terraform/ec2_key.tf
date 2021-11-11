provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami           = "ami-01cc34ab2709337aa" 
  instance_type = "t2.micro"
  subnet_id     = "subnet-4d3f547c"
  security_groups = ["sg-0476c701b0753d1e4"]
  key_name      = "lab"  #using existed key  
  
  tags = {
    Name = "Web Server"
 }
}

