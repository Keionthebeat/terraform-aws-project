# Terraform AWS Project

## Project Overview

This project demonstrates how to use Terraform to set up a scalable and highly available web service on AWS. The infrastructure includes a Virtual Private Cloud (VPC), subnets, an Internet Gateway, route tables, security groups, EC2 instances with an Apache web server, an Application Load Balancer (ALB), and CloudWatch monitoring with auto-scaling policies.

The web service displays a simple web page with the message: "Hello World! My name is Kei In Cloud!".

## Benefits and Business Solutions

### Reasons Why This is a Good Project
Scalability: The project sets up an auto-scaling group that automatically adjusts the number of EC2 instances based on CPU utilization. This ensures that the web service can handle varying levels of traffic without manual intervention.

High Availability: By using an Application Load Balancer (ALB) and distributing traffic across multiple EC2 instances in different subnets, the project ensures high availability and reliability of the web service.

Infrastructure as Code (IaC): Using Terraform allows businesses to define their infrastructure in code, making it easy to version control, review, and reuse. This leads to more consistent and repeatable deployments.

Cost Efficiency: Auto-scaling policies help optimize costs by adding instances only when needed and removing them when they are not, ensuring that businesses only pay for the resources they use.

Security: The project includes security groups that act as firewalls to control inbound and outbound traffic, enhancing the security of the web service.

Monitoring and Alerts: CloudWatch monitoring and alarms help in proactively managing the infrastructure by setting up alerts for high and low CPU utilization, ensuring that any issues are quickly addressed.

State Management: Using an S3 bucket and DynamoDB table for storing Terraform state files ensures that the state is managed securely and consistently, preventing conflicts and ensuring data integrity.

### Problems It Can Solve for Businesses
Handling Traffic Spikes: Businesses with fluctuating web traffic can benefit from the auto-scaling feature, which ensures that the web service can handle sudden spikes in traffic without downtime.

Reducing Operational Overhead: By automating the deployment and scaling of infrastructure, businesses can reduce the need for manual intervention, freeing up IT staff to focus on more strategic tasks.

Ensuring Business Continuity: High availability and fault tolerance features ensure that the web service remains operational even in the event of hardware failures or other issues, minimizing downtime and ensuring business continuity.

Improving Security Posture: The use of security groups and monitoring helps businesses protect their web services from unauthorized access and quickly respond to potential security threats.

Cost Management: Auto-scaling and efficient resource management help businesses optimize their cloud spending, ensuring they only pay for what they use.

Simplifying Compliance: Infrastructure as Code (IaC) makes it easier to document and audit infrastructure changes, helping businesses meet regulatory and compliance requirements.

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