output "message" {
    value = "This is Output"
}

#output "public_ip_single_server" {
 #value = aws_instance.webserver.public_ip
#}

output "private_ip" {
  value = aws_instance.webserver.*.private_ip
}
output "public_ips" {
  value = aws_instance.webserver.*.public_ip
}



