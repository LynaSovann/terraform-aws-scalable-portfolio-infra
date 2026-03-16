output "vpc_id" {
  value = module.vpc.vpc_id
}

output "alb_dns_name" {
  value = module.alb.alb_dns
}

output "bastion_public_ip" {
  value = module.bastion.public_ip
}

output "asg_name" {
  value = module.asg.asg_name
}
