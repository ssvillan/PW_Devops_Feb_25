provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "./ec2"
  instance_count = 2
}