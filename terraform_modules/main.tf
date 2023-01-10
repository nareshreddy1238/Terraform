provider "aws" {
   region     = "ap-south-1"
}

module "ubuntu" {
  source = ".//ubuntu_instance"
}

module "centos" {
  source = ".//centos_instance"
}

module "s3-bucket" {
  source = ".//bucket"
}