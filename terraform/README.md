# Terraform

Le code Terraform est ajouté progressivement, branche par branche.

Dans la branche `01-artifact-bucket`, vous trouverez :

- `versions.tf` pour la version de Terraform et les providers
- `provider.tf` pour la configuration AWS vers LocalStack
- `main.tf` pour la première ressource du use case
- `outputs.tf` pour les informations utiles à l'exploitation

La première vraie ressource du produit est :

- un bucket S3 local représentant le stockage d'artefacts du modèle

Dans la branche `02-variables-envs`, le projet devient configurable avec :

- `variables.tf`
- `dev.tfvars`
- `prod.tfvars`
- des outputs plus lisibles

Dans la branche `03-inference-runtime`, le produit ajoute une nouvelle brique :

- un runtime d'inférence géré par le provider Docker
- une image buildée depuis `docker/inference_api`
- un conteneur exposé localement via Terraform
