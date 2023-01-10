variable "ami" {
  type = string
  default = "ami-07ffb2f4d65357b42"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "local"
}