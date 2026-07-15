variable "project_name" {
  description = "Nom logique du projet"
  type        = string
}

variable "environment" {
  description = "Environnement cible"
  type        = string
}

variable "runtime_port" {
  description = "Port local d'exposition du runtime"
  type        = number
}

variable "artifact_bucket" {
  description = "Nom du bucket d'artefacts"
  type        = string
}

variable "model_version" {
  description = "Version du modele exposee par le runtime"
  type        = string
  default     = "v1"
}

variable "build_context" {
  description = "Chemin du contexte de build Docker"
  type        = string
}
