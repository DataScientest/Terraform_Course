# Terraform_Course

Ce repo porte le **use case fil rouge** du module Terraform MLOps.

Repo officiel du support :

`https://github.com/DataScientest/Terraform_Course`

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

## Prise en main

Commencez par cloner le repo :

```bash
git clone https://github.com/DataScientest/Terraform_Course.git
cd Terraform_Course
```

Dans ce use case, on évite de dépendre d'une installation locale de Terraform.

Les briques principales du lab sont toutes dockerisées :

- `terraform`
- `localstack`
- `inference-api`

## Workflow rapide

Le repo fournit aussi un `Makefile` pour stabiliser les commandes de base :

```bash
make up
make tf-version
make fmt-check
make validate
make plan-dev
make apply-dev
make output
make destroy-dev
```

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

## Demarrage rapide

```bash
docker compose up --build -d
docker compose exec terraform terraform version
curl http://localhost:4566/_localstack/health
curl http://localhost:8000/health
```
