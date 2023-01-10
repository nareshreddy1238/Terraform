output "redhat_pubip" {
  value       = aws_instance.redhat.public_ip
  description = "Public IP address of EC2 instance"
}