provider "local" {}

resource "local_file" "sample" {
  filename = "hello.txt"
  content = "Hello From Terraform !!"
}
# move to the directory where this file is located
# terraform init
# terraform plan
# terraform apply