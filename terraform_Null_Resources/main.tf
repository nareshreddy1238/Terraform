provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "ec2_example" {
  ami           = "ami-0cca134ec43cf708f"
  instance_type =  "t2.micro"
  tags = {
    Name = "Terraform EC2 "
  }
}

# The following null resource will print message "Hello World"
resource "null_resource" "null_resource_simple" {
  provisioner "local-exec" {
    command = "echo Hello World"
  }
}

# The following null resource has the trigger
resource "null_resource" "null_resource_simple1" {
  # This trigger will only execute once when it detects the instance id of EC2 instance 
  triggers = {
    id = aws_instance.ec2_example.id    # to execute it every time replace - id = time()
  }
  provisioner "local-exec" {
    command = "echo Hello World"
  }
}

resource "null_resource" "null_resource_with_remote_exec" {
  triggers = {
    id = aws_instance.ec2_example.id
  }
  provisioner "remote-exec" {
    inline = [
      "touch hello.txt",
      "echo helloworld remote provisioner >> hello.txt",
    ]
  }
  connection {
      type        = "ssh"
      host        = aws_instance.ec2_example.public_ip
      user        = "centos"
      private_key = file("C:/Users/nares/Downloads/local.pem")
      timeout     = "4m"
   }  

}
