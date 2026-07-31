variable "project_name" {
  description = "Nom logique du projet"
  type        = string
  default     = "fraud-scoring"
}

variable "environment" {
  description = "Environnement cible"
  type        = string
}

variable "aws_region" {
  description = "Region logique du provider AWS-like"
  type        = string
  default     = "eu-west-3"
}

variable "runtime_port" {
  description = "Port local d'exposition du runtime d'inference gere par Terraform"
  type        = number
  default     = 8001
}

variable "artifact_bucket_suffixes" {
  description = "Suffixes des buckets d'artefacts a creer"
  type        = set(string)
  default     = ["artifacts"]
}
