provider "aws" {
  region = var.region
}

# Create S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-cloudwatch-monitoring-bucket-${random_id.suffix.hex}"
  force_destroy = true

  tags = {
    Name = "cloudwatch-s3-bucket"
  }
}

# Random suffix to make bucket name unique
resource "random_id" "suffix" {
  byte_length = 4
}

# Enable Bucket-level CloudWatch metrics
resource "aws_s3_bucket_metric" "request_metrics" {
  bucket = aws_s3_bucket.my_bucket.id
  name   = "EntireBucket"

  filter {
    prefix = ""
  }
}

# Create CloudWatch Alarm for 4xx Errors
resource "aws_cloudwatch_metric_alarm" "s3_4xx_alarm" {
  alarm_name          = "S3-4XX-Errors"
  namespace           = "AWS/S3"
  metric_name         = "4xxErrors"
  statistic           = "Sum"
  period              = 300
  evaluation_periods  = 1
  threshold           = 1
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_description   = "Alarm if S3 bucket receives 4xx errors"
  dimensions = {
    BucketName = aws_s3_bucket.my_bucket.bucket
    StorageType = "AllStorageTypes"
  }
}
