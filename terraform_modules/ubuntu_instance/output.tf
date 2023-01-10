output "debian_pubip" {
  value       = aws_instance.debian.public_ip
  description = "Public IP address of EC2 instance"
}