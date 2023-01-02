variable "region" {
    default = "ap-south-1"
}
variable "ami" {
    default = "ami-0763cf792771fe1bd"
}
variable "instance_type" {
    description = "Instance Type"
    type = string
    default = "t2.micro"
}

variable "instance_count" {
    description ="Instance Count"
    type = number
    default = 2
}

variable "enable_public_ip" {
    description ="Enable Public IP Address"
    type = bool
    default = true
}

variable "user_names" {
    description ="IAM Usernames"
    type = list(string)
    default = ["user1","user2","user3"]
}

variable "project_environment" {
    description = "project name and environment"
    type = map(string)
    default = {
        project = "intel_bangalore",
        environment = "dev"
    }
}

variable "key" {
    default = "local"
    sensitive = true
}