output "alb_dns_name" {
  description = "ALB DNS name to access the portfolio"
  value       = aws_lb.main.dns_name
}

output "bastion_public_ip" {
  description = "Bastion host public IP for SSH"
  value       = aws_instance.bastion.public_ip
}
