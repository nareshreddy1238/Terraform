resource "aws_instance" "redhat" {
    ami = var.ami
    instance_type = var.instance_type
    key_name= var.key_name

  user_data = <<-EOF
      #!/bin/sh
      sudo yum -y install httpd
      sudo systemctl status httpd
      sudo systemctl start httpd
      sudo chown -R $USER:$USER /var/www/html
      sudo echo "<html><body><h1>Hello this is module-2 at instance id `curl http://169.254.169.254/latest/meta-data/instance-id` </h1></body></html>" > /var/www/html/index.html
      EOF
}

