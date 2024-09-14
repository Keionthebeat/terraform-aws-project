# Create a launch template for the EC2 instances
resource "aws_launch_template" "web" {
  name_prefix   = "web-"
  image_id      = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello World! My name is Kei In Cloud!" > /var/www/html/index.html
              EOF

  tags = {
    Name = "web-instance"
  }
}

# Create an Auto Scaling group
resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 1
  max_size             = 5
  min_size             = 1
  vpc_zone_identifier  = [aws_subnet.public_1.id, aws_subnet.public_2.id, aws_subnet.public_3.id]
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "web-instance"
    propagate_at_launch = true
  }
}