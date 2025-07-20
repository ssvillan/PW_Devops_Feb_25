provider "aws" {
    region = var.region
  
}

resource "aws_key_pair" "deployer" {
    key_name = "mylogstash-key"
    public_key = file("/mnt/c/Users/NEW/.ssh/id_rsa.pub")
}

resource "aws_security_group" "logstash_sg" {
  name = "logstash-sg"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 5044
    to_port = 5044
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 5601
    to_port = 5601
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

resource "aws_instance" "logstash_server" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.deployer.key_name
    security_groups = [aws_security_group.logstash_sg.name]

    tags = {
      Name ="logstash-demo"
    }
  
}