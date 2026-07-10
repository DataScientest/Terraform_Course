resource "aws_s3_bucket" "model_artifacts" {
  bucket = "${var.project_name}-${var.environment}-artifacts"

  tags = {
    project     = #Todo
    environment = #Todo
    managed_by  = "terraform"
  }
}
