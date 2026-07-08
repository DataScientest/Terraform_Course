resource "aws_s3_bucket" "model_artifacts" {
  bucket = "${var.project_name}-${var.environment}-artifacts"

  tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}
