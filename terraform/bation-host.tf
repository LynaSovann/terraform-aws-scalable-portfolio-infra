resource "aws_instance" "bastion" {
  ami                         = "ami-0ec10929233384c7f"
  instance_type               = "t2.micro"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.bastion.id]
  key_name                    = "portfolio-bastion-host-key"
  associate_public_ip_address = true

  tags = {
    Name = "bastion-host"
  }
}
