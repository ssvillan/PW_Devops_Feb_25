output "elk_instance_ip" {
  value = aws_instance.elk.public_ip
}