# Terraform AWS Project

## Project Overview

This project demonstrates how to use Terraform to set up a scalable and highly available web service on AWS. The infrastructure includes a Virtual Private Cloud (VPC), subnets, an Internet Gateway, route tables, security groups, EC2 instances with an Apache web server, an Application Load Balancer (ALB), and CloudWatch monitoring with auto-scaling policies.

The web service displays a simple web page with the message: "Hello World! My name is Kei In Cloud!".

## File List and Descriptions

### provider.tf
**Description**: Configures the AWS provider and sets the region to Ireland.

### vpc.tf
**Description**: Creates a Virtual Private Cloud (VPC), which is a private network in the cloud where resources can be created.

### subnets.tf
**Description**: Creates public and private subnets within the VPC. Public subnets can be accessed from the internet, while private subnets cannot.

### internet_gateway.tf
**Description**: Creates an Internet Gateway, which allows the VPC to connect to the internet.

### route_tables.tf
**Description**: Creates route tables and associates them with the subnets. Route tables are like maps that tell the VPC how to send traffic to the internet or within the VPC.

### security_groups.tf
**Description**: Creates security groups for the web service and the load balancer. Security groups act like firewalls that control who can access the services.

### launch_template.tf
**Description**: Sets up a launch template for EC2 instances with Apache web server and an Auto Scaling group. The instances display a simple web page that says "Hello World! My name is Kei In Cloud!".

### cloudwatch.tf
**Description**: Sets up CloudWatch monitoring and scaling policies. If CPU usage goes above 60%, it adds more instances. If CPU usage goes below 20%, it removes instances.

### alb.tf
**Description**: Sets up an Application Load Balancer (ALB) and its related resources. The ALB distributes incoming traffic across multiple EC2 instances to ensure high availability and reliability.

### s3_backend.tf
**Description**: Creates an S3 bucket and DynamoDB table for storing Terraform state files and managing state locking. This ensures that the Terraform state is managed securely and consistently.

## Setup Instructions

1. **Clone the Repository**:
   ```sh
   git clone https://github.com/Keionthebeat/terraform-aws-project
   cd terraform-aws-project