resource "aws_security_group" "alb_sg" {
    name = "alb_sg"
    description = "Allow HTTP"
    vpc_id = var.vpc_id
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_lb" "alb" {
    name = "simple-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.alb_sg.id]
    subnets = var.subnet_ids
    access_logs {
      bucket = var.log_bucket
      prefix = "alb-logs"
      enabled = true
    }
  
}

resource "aws_lb_target_group" "tg" {
    name = "alb-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
  health_check {
    enabled = true
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    interval = 30
    path = "/"
    matcher = "200-299"  # status codes
  }
}

resource "aws_lb_listener" "http" {
    load_balancer_arn = aws_lb.alb.arn
    port = 80
    protocol = "HTTP"
    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.tg.arn
    }
}

resource "aws_lb_target_group_attachment" "attach" {
    count = length(var.instance_ids)
    target_group_arn = aws_lb_target_group.tg.arn
    target_id = var.instance_ids[count.index]
    port = 80
  
}

 