provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami           = "ami-01cc34ab2709337aa" 
  instance_type = "t2.micro"
  subnet_id     = "subnet-4d3f547c"
  security_groups = ["sg-0476c701b0753d1e4"]
  key_name      = aws_key_pair.key.id
  
  tags = {
    Name = "Web Server"
 }
}


resource "aws_key_pair" "key" {
  key_name   = "sample"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFhBZBaNHU4/E5rQmeSVv/e1EZT9qfgV6Mk+sUvk38Ays114afZcalNuZi4RWMs5HJQ41cyBACylvHEPswGYb9jtgi5U9M+bT19EoYLWjFa6WFSs+QNHxTwZmBChKAa4inBAHtllF5/r2Cxw2+O7Iy2T6iBBAxCxf22S1P3u+HNepCnmlQS+KLo5tVSx/9DTgv8pwq7BZd2XgGRgjqchphHMS+KN9tg+Pr7np/0OiRP7QfFjkqmGAlQA4x/tEvDtF1aQbTU+YDIcpG2Zkth5cyI6eKqTSZSUYeeCji+0Ppq8443uSy/EYZNQQ1bT8JAa79YdFXUyD1cmMpUUnyq6yx naresh@naresh"
}
