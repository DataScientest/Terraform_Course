terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.project_name}-${var.environment}-artifacts"

  tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}
