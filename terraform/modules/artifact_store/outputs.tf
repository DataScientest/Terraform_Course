output "bucket_names" {
  description = "Noms des buckets crees par le module"
  value       = { for key, bucket in aws_s3_bucket.this : key => bucket.bucket }
}
