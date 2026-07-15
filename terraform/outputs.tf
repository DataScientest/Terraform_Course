output "artifact_bucket_name" {
  description = "Nom du bucket d'artefacts du modele"
  value       = module.artifact_store.bucket_name
}

output "environment" {
  description = "Environnement actuellement vise"
  value       = var.environment
}

output "localstack_s3_endpoint" {
  description = "Endpoint S3 LocalStack utilise par Terraform"
  value       = "http://localhost:4566"
}

output "inference_runtime_url" {
  description = "URL locale du runtime d'inference gere par Terraform"
  value       = module.inference_service.runtime_url
}
