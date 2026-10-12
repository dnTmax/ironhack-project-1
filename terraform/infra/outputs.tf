output "frontend_public_ip" {
  value = aws_instance.frontend.public_ip
}

output "private_ips" {
  value = local.ips
}
