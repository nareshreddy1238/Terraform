variable "reg" {
  type = string
  default = "us-east-1"
}

variable "ami" {
  type = string
  default = "ami-01cc34ab2709337aa"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "subnet" {
  type = list
  default = ["subnet-4d3f547c,subnet-1c1f3b7a"]
}

variable "sec_grp"  {
  type = string
  default = "sg-0476c701b0753d1e4"
}

variable "key_name" {
  type = string
  default = "lab"
}

