module "artifact_store" {
  source = "./modules/artifact_store"

  project_name = var.project_name
  environment  = var.environment
}

module "inference_service" {
  source = "./modules/inference_service"

  project_name    = var.project_name
  environment     = var.environment
  runtime_port    = var.runtime_port
  artifact_bucket = module.artifact_store.bucket_name
  build_context   = "${path.module}/../docker/inference_api"
}
