provider "aws" {
  region  = "us-east-1"
}

####### VPC #####
resource "aws_vpc" "vpc" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "BAN_VPC"
  }
}

######## Subnets ####
resource "aws_subnet" "pub" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public"
  }
}
resource "aws_subnet" "pri" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.3.0/24"

  tags = {
    Name = "Private"
  }
}

######## Internet Gateway ######
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "IGW"
  }
}

######## Elastic IP ############
resource "aws_eip" "eip" {
  vpc      = true
}

######## NAT Gateway ##########
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.pri.id

  tags = {
    Name = "NGW"
  }
}

######## Route Table ###########
resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }

  tags = {
    Name = "Custom"
  }
}


resource "aws_route_table" "rt2" {
  vpc_id = aws_vpc.vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.ngw.id
    }

  tags = {
    Name = "Main"
  }
}

################ Subnet Association ########
resource "aws_route_table_association" "sa_1" {
  subnet_id      = aws_subnet.pub.id
  route_table_id = aws_route_table.rt1.id
}

resource "aws_route_table_association" "sa_2" {
  subnet_id      = aws_subnet.pri.id
  route_table_id = aws_route_table.rt2.id
}


############# Security Group ############
resource "aws_security_group" "sg" {
  name        = "HTTPD"
  description = "Allow Web Server inbound traffic"
  vpc_id      = aws_vpc.vpc.id
 
  ingress {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.vpc.cidr_block]
    }
  
  ingress {
      description      = "HTTP from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.vpc.cidr_block]
    }
 
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  
  tags = {
    Name = "Web Server"
  }
}

