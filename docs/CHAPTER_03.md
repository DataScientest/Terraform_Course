# Chapitre 3 - Runtime d'inférence avec le provider Docker

## Objectif

Ajouter une vraie brique applicative Terraform au produit :

- une image Docker
- un conteneur d'inférence local
- un output applicatif exploitable

La branche de depart est volontairement incomplete. Le bucket S3 est deja present, mais le provider Docker et les ressources du runtime restent a terminer.

## Pourquoi un port différent ?

Le lab conserve déjà une API lancée par `docker-compose` sur le port `8000`.

Dans cette branche, Terraform gère un runtime d'inférence séparé sur un autre port, afin de :

- apprendre le provider Docker
- ne pas casser le setup initial
- comparer plus facilement la logique de bootstrap et la logique managée par Terraform

## Fichiers clés

- `terraform/versions.tf`
- `terraform/provider.tf`
- `terraform/variables.tf`
- `terraform/main.tf`
- `terraform/outputs.tf`
- `terraform/environments/dev/dev.tfvars`

## Travail attendu dans cette branche

- declarer le provider Docker dans `terraform/provider.tf`
- completer `runtime_port` dans `terraform/environments/dev/dev.tfvars`
- ajouter l'image Docker du runtime dans `terraform/main.tf`
- ajouter le conteneur Docker dans `terraform/main.tf`

## Commandes utiles

```bash
docker-compose up -d
./terraform/scripts/tf.sh init
./terraform/scripts/tf.sh fmt -check
./terraform/scripts/tf.sh validate
./terraform/scripts/tf.sh plan -var-file=environments/dev/dev.tfvars -out=tfplan
./terraform/scripts/tf.sh apply -auto-approve tfplan
./terraform/scripts/tf.sh output
curl http://localhost:8001/health
./terraform/scripts/tf.sh destroy -auto-approve -var-file=environments/dev/dev.tfvars
```

## Ce que cette branche apporte au produit

Avant cette branche, le produit disposait d'un stockage d'artefacts configurable.

Après cette branche, il possède aussi :

- un runtime d'inférence géré par Terraform via Docker
- une URL locale d'exploitation via output
