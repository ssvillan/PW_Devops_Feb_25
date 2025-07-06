provider "aws" {
    region = "us-east-1"
}

#ec2 + I AM role to send logs
resource "aws_iam_role" "cw_role" {
  name = "cw-role"
  assume_role_policy = jsonencode({
    Version="2012-10-17",
    Statement=[{
        Effect="Allow",
        Principal={
            Service="ec2.amazonaws.com"
        },
        Action="sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "cw_policy" {

    role=aws_iam_role.cw_role.name  
    policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"

}

resource "aws_iam_instance_profile" "cw_profile" {
    name="cw-instance-profile"
    role=aws_iam_role.cw_role.name
}
resource "aws_instance" "web" {
  ami="ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.cw_profile.name
  user_data = file("user-data.sh")

  tags = {
    Name="cw-instance"
  }
}

#CloudWatch CPU Alarm
resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name = "HighCPUAlarm"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  statistic = "Average"
  period = 60
  evaluation_periods = 2
  threshold = 70
  comparison_operator = "GreaterThanThreshold"
  alarm_description = "CPU usage > 70%"
  dimensions = {
    InstanceId= aws_instance.web.id
  }
}