output "artifact_bucket_name" {
  description = "Nom du bucket d'artefacts du modele"
  value       = aws_s3_bucket.model_artifacts.bucket
}

output "localstack_s3_endpoint" {
  description = "Endpoint S3 LocalStack utilise par Terraform"
  value       = "http://localhost:4566"
}
