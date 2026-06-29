# Terraform_Course

Ce repo porte le **use case fil rouge** du module Terraform MLOps.

L'objectif est de faire grandir progressivement une **mini-plateforme locale de scoring de fraude** en s'appuyant sur :

- Terraform
- LocalStack
- Docker

Le produit final visé n'est pas une plateforme cloud complète, mais une base locale crédible permettant de :

- stocker des artefacts modèle dans un bucket de type S3
- faire tourner une API d'inférence Dockerisée
- configurer plusieurs environnements
- comprendre le state Terraform
- structurer un projet infra maintenable

## Logique de travail

Le repo sera construit **branche par branche**.

Chaque branche représentera :

- un état stable du produit
- une étape pédagogique du cours
- une progression Terraform + MLOps cohérente

## Structure du repo

- `docker/` : runtime de l'API d'inférence et éléments liés au provider Docker
- `localstack/` : configuration et lancement de LocalStack
- `terraform/` : code Terraform principal
- `terraform/environments/` : variations `dev` et `prod`
- `terraform/modules/` : modules simples si nécessaires plus tard
- `terraform/scripts/` : scripts d'aide pour le lab
- `tests/` : smoke tests et vérifications simples
- `docs/` : notes techniques et documentation du use case

## Première étape prévue

La première branche de travail sera :

- `00-setup-local`

Elle servira à préparer :

- Docker
- LocalStack
- les healthchecks de base
- la structure initiale du use case
