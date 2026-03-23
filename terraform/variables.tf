variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "my_ip" {
  description = "Your IP address for SSH access to bastion (e.g. 1.2.3.4/32)"
  type        = string
  default     = "175.100.53.127/32"
}
