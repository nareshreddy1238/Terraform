provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "webserver" {
    ami                         = "ami-0cca134ec43cf708f"                      
    instance_type               = "t2.micro" 
    key_name                    = "local"
    vpc_security_group_ids      = [aws_security_group.dbtest.id]
}

locals {
   ingress_rules = [{
      port        = 80
      description = "Webserver http"
   },
   {
      port        = 8080
      description = "Jenkins or Apache Tomcat"
   },
   {
      port        = 8081
      description = "Nexus"
   },
   {
      port        = 9000
      description = "SonarQube"
   },
   {
      port        = 443
      description = "Webserver https"
   }
   ]
}

resource "aws_security_group" "dbtest" {
  name        = "DBTest"
  dynamic "ingress" {
      for_each = local.ingress_rules
      content {
         description = ingress.value.description
         from_port   = ingress.value.port
         to_port     = ingress.value.port
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
      }
   }
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }
}