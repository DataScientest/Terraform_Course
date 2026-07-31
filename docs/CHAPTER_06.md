# Chapitre 6 - Validation finale et bonnes pratiques

## Objectif

Amener le produit dans un état propre, vérifiable et transmissible.

## Ce que la branche apporte

- un smoke test plus complet
- un workflow final stable via `Makefile`
- une logique claire de validation avant apply

Le smoke test ne se contente plus d'appeler des endpoints. Il vérifie aussi que :

- LocalStack repond en HTTP sans erreur
- le service S3 de LocalStack est bien disponible
- `/health` renvoie un `status=ok`
- `/predict` renvoie un `fraud_score` numerique
- une route inexistante echoue bien en `404`

## Workflow recommandé

```bash
make up
make tf-version
make fmt-check
make validate
make plan-dev
make apply-dev
make output
make smoke-dev-runtime
make destroy-dev
```

## Ce que ce workflow valide

- la forme du code Terraform
- la cohérence de la configuration
- le plan d'exécution en `dev`
- l'application réelle de l'infrastructure
- la disponibilité du runtime d'inférence Terraform
- la capacité à nettoyer proprement le produit

## Point pédagogique important

LocalStack et Docker permettent ici de pratiquer des patterns crédibles, mais ils ne remplacent pas un vrai cloud de production.

L'objectif est de stabiliser les bons réflexes d'Infrastructure as Code, pas de simuler toutes les subtilités d'AWS réel.
