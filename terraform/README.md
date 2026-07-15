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

Dans la branche `04-state-collaboration`, le produit ne change pas fortement de forme, mais le repo gagne en discipline :

- un `Makefile` pour le workflow courant
- une documentation explicite sur le `state`
- un exemple de backend S3-like pour illustrer la collaboration

Dans la branche `05-structure-modules`, le produit est restructuré autour de deux modules simples :

- `artifact_store`
- `inference_service`

L'objectif n'est pas de modulariser tout le projet à outrance, mais de montrer une factorisation utile et lisible.
