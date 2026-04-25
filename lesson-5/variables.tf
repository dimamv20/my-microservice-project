variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "backend_bucket_name" {
  description = "S3 bucket name for Terraform state"
  type        = string
  default     = "dmytro-lesson-5-terraform-state"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name for Terraform state locking"
  type        = string
  default     = "terraform-locks"
}