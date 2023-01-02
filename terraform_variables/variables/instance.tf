provider "aws" {
    region = var.region
}

resource "aws_instance" "web" {
    ami                         = var.ami                        ## string
    instance_type               = var.instance_type              ## string
    count                       = var.instance_count             ## number
    associate_public_ip_address = var.enable_public_ip           ## bool
    key_name                    = var.key                        ## string
    tags                        = var.project_environment        ## map
}
resource "aws_iam_user" "example" {                 
    count = length(var.user_names)                               ## list
    name = var.user_names[count.index]
}

