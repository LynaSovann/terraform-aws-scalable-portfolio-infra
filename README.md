# Scalable AWS Portfolio Infrastructure with Terraform

This project provisions a **secure and scalable AWS infrastructure** for hosting a personal portfolio website using **Infrastructure as Code (Iac)** with Terraform.

The architecture follows **DevOps best practices** by separating public and private resources, restricting direct internet access to backend servers, and enabling automatic scaling.

---

## Architecture Overview

The infrastructure is deployed inside **Amazon Virtual Private Clound** with the following structure:

VPC (10.0.0.0/16)
Public Subnet (10.0.1.0/24)
├── Internet Gateway
├── Load Balancer
├── Bastion Host
└── NAT Gateway

Private Subnet (10.0.2.0/24)
└── Auto Scaling Group
└── EC2 Web Servers

<img src="./assets/aws-diagram.png" alt="skdfkafjlksdfjksdfj">

### Key Services

- Amazon EC2 - Hosts the portfolio web servers
- Elastic Load Balancing - Distributes incoming traffic
- AWS Auto Scaling - Automatically scales EC2 instances
- Amazon Virtual Private Cloud - Provides isolated netowrk infrastructure

---

## Networking Design

Two subnets are created within a single Availability Zone:

1. **Subnet**: Public Subnet
   - **Purpose** : Internet-facing resources
2. **Subnet** : Private Subnet
   - **Subnet** : Application servers

### Route Tables

- **Public Route Table**
  0.0.0.0/0 → Internet Gateway
- **Private Route Table**
  0.0.0.0/0 → NAT Gateway
  This ensures:
- Public services can receive internet traffic.
- Private servers can access the internet for updates without being exposed.

---

## Security Design

Security is implemented using multiple layers:

- **Bastion Host**
  - Allow controlled SSH acccess to private instances.
- **Load Balancer**
  - Handles all public HTTPS traffic.
- **Private Web Service**
  - No public IP addresses.
  - Accessible only through the load balancer or bastion host.

---

## Features

- Infrastructure fully managed with **Terraform**
- Isolated networking using VPC
- Secure private web servers
- Bastion host for controlled access
- Auto Scaling for high availability
- Clean and simple architecture suitable for learning DevOps practices

---

## Deployment

Initialze Terraform

```bash
terraform init
```

Review the execution plan

```bash
terraform plan
```

Apply the infrastructure

```bash
terraform apply
```

---

## Purpose

This project demonstrates how to design and deploy a **secure**, **scalable AWS network architecture** using Terraform while following **common DevOps infrastructure patterns**.
