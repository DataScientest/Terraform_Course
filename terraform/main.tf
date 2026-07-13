resource "aws_s3_bucket" "model_artifacts" {
  bucket = "${var.project_name}-${var.environment}-artifacts"

  tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "docker_image" "inference_runtime" {
  name = "${var.project_name}-${var.environment}-inference:latest"

  build {
    context = "${path.module}/../docker/inference_api"
  }
}

resource "docker_container" "inference_runtime" {
  name  = "${var.project_name}-${var.environment}-inference"
  image = docker_image.inference_runtime.image_id

  ports {
    internal = 8000
    external = var.runtime_port
  }

  env = [
    "MODEL_VERSION=v1",
    "ARTIFACT_BUCKET=${aws_s3_bucket.model_artifacts.bucket}",
  ]
}
