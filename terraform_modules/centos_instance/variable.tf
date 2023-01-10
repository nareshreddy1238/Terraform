variable "ami" {
  type = string
  default = "ami-0763cf792771fe1bd"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "local"
}