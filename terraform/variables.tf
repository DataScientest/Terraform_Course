variable "project_name" {
  description = "Nom logique du projet"
  type        = string
  default     = "fraud-scoring"
}

variable "environment" {
  description = "Environnement cible"
  type        = #Todo
}

variable "aws_region" {
  description = "Region logique du provider AWS-like"
  type        = #Todo
  default     = "eu-west-3"
}
