provider "aws" {
    region = "us-east-1"
}

module "s3-backend" {
  source = "./modules/s3-backend"
  prefix = "nikunj-bucket"
}

