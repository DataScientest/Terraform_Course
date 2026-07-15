terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "this" {
  name = "${var.project_name}-${var.environment}-inference:latest"

  build {
    context = var.build_context
  }
}

resource "docker_container" "this" {
  name  = "${var.project_name}-${var.environment}-inference"
  image = docker_image.this.image_id

  ports {
    internal = 8000
    external = var.runtime_port
  }

  env = [
    "MODEL_VERSION=${var.model_version}",
    "ARTIFACT_BUCKET=${var.artifact_bucket}",
  ]
}
