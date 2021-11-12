provider "aws" {
  region = varsub.reg
}

resource "aws_instance" "webserver" {
  count = 2  ################ create the multiple servers #################
  ami           = varsub.ami
  instance_type = varsub.instance_type
  subnet_id     = element(varsub.subnet,count.index) ######### Two different Availability Zones:AZ(Subnets) #######
  security_groups = ["${varsub.sec_grp}"]
  key_name      = varsub.key_name
  
  tags = {
    Name = "Web Server ${count.index+1}"
 }
}

