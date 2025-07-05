output "instance_public_ip" {
  description = "The Public IP Address of the webserver"
  value = aws_instance.web.public_ip
}

output "instance_id" {
  description = "The ID of AWS Instance"
  value = aws_instance.web.id
}