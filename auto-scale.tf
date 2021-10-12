# define autoscaling launch configuration
resource "aws_launch_configuration" "custom-launch-config" {

    name = "custom-launch-config"
    image_id = data.aws_ami.amazon-linux-2.id
    instance_type = "t2.micro"
    key_name = aws_key_pair.mykey.key_name
    
}

# define autoscaling group
resource "aws_autoscaling_group" "auto-scaling-grp" {
  name                      = "auto-scaling-group"
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 100
  health_check_type         = "EC2"
  force_delete              = true
  launch_configuration      = aws_launch_configuration.custom-launch-config.name
  vpc_zone_identifier       = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]

  tag {
    key                 = "Name"
    value               = "custom_ec2_instance"
    propagate_at_launch = true
  }
}

# Define autoscaling policy
resource "aws_autoscaling_policy" "custom-cpu-policy" {
  name                   = "custom-cpu-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.auto-scaling-grp.name
  policy_type = "SimpleScaling"
}

# define cloud watch monitoring

resource "aws_cloudwatch_metric_alarm" "custom-cpu-alarm" {
  alarm_name          = "custom-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 20

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.auto-scaling-grp.name
  }

  actions_enabled = true
  alarm_actions     = [aws_autoscaling_policy.custom-cpu-policy.arn]
}

# Define autoscaling policy
resource "aws_autoscaling_policy" "custom-cpu-policy-scaledown" {
  name                   = "custom-cpu-policy-scaledown"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.auto-scaling-grp.name
  policy_type = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "custom-cpu-alarm-scaledown" {
  alarm_name          = "custom-cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 10

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.auto-scaling-grp.name
  }

  actions_enabled = true
  alarm_actions     = [aws_autoscaling_policy.custom-cpu-policy.arn]
}











