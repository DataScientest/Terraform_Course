resource "aws_s3_bucket" "model_artifacts" {
  bucket = "fraud-model-artifacts"

  tags = {
    project     = "fraud-scoring"
    environment = "dev"
    managed_by  = "terraform"
  }
}
