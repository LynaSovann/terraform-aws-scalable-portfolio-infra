resource "aws_launch_template" "web" {
  name_prefix            = "web-"
  image_id               = "ami-02dfbd4ff395f2a1b"
  instance_type          = var.instance_type
  key_name               = "portfolio-web-key"
  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd git
    systemctl start httpd
    systemctl enable httpd
    rm -rf /var/www/html/*
    cd /var/www/html
    git clone -b from-main https://github.com/LynaSovann/lyna-sovann-portfolio.git .
    systemctl restart httpd
  EOF
  )
}

resource "aws_autoscaling_group" "web" {
  name                = "web-asg"
  desired_capacity    = 2
  min_size            = 1
  max_size            = 4
  vpc_zone_identifier = module.vpc.private_subnets
  target_group_arns   = [aws_lb_target_group.web.arn]

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "web-server"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "cpu_tracking" {
  name                   = "cpu-target-tracking"
  autoscaling_group_name = aws_autoscaling_group.web.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value     = 50.0
    disable_scale_in = false
  }
}
