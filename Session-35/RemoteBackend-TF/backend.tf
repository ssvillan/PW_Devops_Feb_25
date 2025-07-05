terraform {
  backend "s3" {
    bucket = "nikunj-bucket-0c126753"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
