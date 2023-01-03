provider "aws" {
    region = "ap-south-1"
}
resource "aws_instance" "webserver" {
    #count = 1
    ami                         = "ami-0763cf792771fe1bd"                       
    instance_type               = "t2.micro"    
    tags = {
        #Name = "Web Server ${count.index+1}"
        Name = "webserver"
 }    
}
resource "aws_iam_user" "count" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

resource "aws_iam_user" "for_each_set" {
  for_each = var.users_for_each_set
  name  = each.value
}

resource "aws_iam_user" "for_each_set" {
  for_each = var.users_for_each_map
  name  = each.value
}



