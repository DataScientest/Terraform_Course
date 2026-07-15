output "bucket_name" {
  description = "Nom du bucket d'artefacts"
  value       = aws_s3_bucket.this.bucket
}
