# Chapitre 4 - State, collaboration et workflow propre

## Objectif

Faire comprendre comment Terraform suit réellement le produit, et introduire une manière plus propre de travailler sur l'infrastructure.

## Ce que la branche apporte

- suppression de `tfplan` des fichiers suivis
- `.gitignore` corrigé
- `Makefile` pour les commandes usuelles
- documentation dédiée au `state`
- exemple de backend S3-like avec LocalStack

## Commandes utiles

```bash
make up
make tf-version
make fmt-check
make validate
make plan-dev
make apply-dev
make output
make state-list
make destroy-dev
```

## Intention pédagogique

Le but n'est pas encore de faire du backend distant un prérequis du lab.

Le but est d'introduire :

- le rôle du state
- les risques du state local
- le fait qu'un workflow propre compte autant que la syntaxe Terraform
