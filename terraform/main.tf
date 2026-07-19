resource "aws_s3_bucket" "model_artifacts" {
  bucket = #TODO

  tags = {
    project     = #TODO
    environment = "dev"
    managed_by  = "terraform"
  }
}
