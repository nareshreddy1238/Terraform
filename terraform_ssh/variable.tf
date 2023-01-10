variable "key_name" {
  type    = string
  default = "id_rsa_games247"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "ami" {
    type = string
    default = "ami-0cca134ec43cf708f" 
}