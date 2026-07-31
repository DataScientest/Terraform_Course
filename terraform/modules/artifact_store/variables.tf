variable "project_name" {
  description = "Nom logique du projet"
  type        = string
}

variable "environment" {
  description = "Environnement cible"
  type        = string
}

variable "bucket_suffixes" {
  description = "Suffixes des buckets a creer pour le produit"
  type        = set(string)
}
