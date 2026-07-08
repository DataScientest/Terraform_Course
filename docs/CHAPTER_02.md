# Chapitre 2 - Variables, tfvars et outputs

## Objectif

Rendre la première brique du produit configurable selon l'environnement.

## Fichiers clés

- `terraform/variables.tf`
- `terraform/main.tf`
- `terraform/provider.tf`
- `terraform/outputs.tf`
- `terraform/environments/dev/dev.tfvars`
- `terraform/environments/prod/prod.tfvars`

## Commandes utiles

```bash
docker compose up -d
./terraform/scripts/tf.sh init
./terraform/scripts/tf.sh fmt -check
./terraform/scripts/tf.sh validate
./terraform/scripts/tf.sh plan -var-file=environments/dev/dev.tfvars
./terraform/scripts/tf.sh apply -auto-approve -var-file=environments/dev/dev.tfvars
./terraform/scripts/tf.sh output
./terraform/scripts/tf.sh destroy -auto-approve -var-file=environments/dev/dev.tfvars
```

## Ce que cette branche apporte au produit

Avant cette branche, le bucket existait dans une forme figée.

Après cette branche, le produit sait :

- distinguer `dev` et `prod`
- faire varier les noms selon l'environnement
- exposer un état plus lisible grâce aux outputs
