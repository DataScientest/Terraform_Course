# Chapitre 1 - Bucket d'artefacts avec Terraform et LocalStack

## Objectif

Créer la première vraie brique MLOps du produit fil rouge :

- un bucket d'artefacts modèle de type S3

## Fichiers clés

- `terraform/versions.tf`
- `terraform/provider.tf`
- `terraform/main.tf`
- `terraform/outputs.tf`

## Commandes utiles

Depuis la racine du repo :

```bash
docker-compose up -d
./terraform/scripts/tf.sh init
./terraform/scripts/tf.sh fmt
./terraform/scripts/tf.sh plan
./terraform/scripts/tf.sh apply
./terraform/scripts/tf.sh state list
./terraform/scripts/tf.sh output
./terraform/scripts/tf.sh destroy
```

## Ce que cette branche apporte au produit

Avant cette branche, le produit avait :

- un faux cloud local
- une API d'inférence locale

Après cette branche, il a en plus :

- un stockage d'artefacts modèle provisionné proprement par Terraform
