#!/bin/bash

# Step 1: Init and apply to create S3 bucket (local state)
terraform init
terraform apply -auto-approve

# Step 2: Get bucket name from output (must be defined in output.tf)
BUCKET_NAME=$(terraform output -raw bucket_name)

# Check if value is empty
if [ -z "$BUCKET_NAME" ]; then
  echo "❌ ERROR: bucket_name output is empty. Check output.tf and terraform apply result."
  exit 1
fi

# Step 3: Create backend.tf for S3 backend
cat > backend.tf <<EOF
terraform {
  backend "s3" {
    bucket = "$BUCKET_NAME"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
EOF

echo "✅ backend.tf created using bucket: $BUCKET_NAME"

# Step 4: Re-initialize with S3 backend
terraform init -migrate-state -reconfigure

# Step 5: Apply again if needed
terraform apply -auto-approve
