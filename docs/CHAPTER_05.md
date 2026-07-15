# Chapitre 5 - Structure et modules

## Objectif

Rendre le projet Terraform plus maintenable sans tomber dans la sur-abstraction.

## Ce que la branche apporte

- deux modules simples : `artifact_store` et `inference_service`
- un `main.tf` plus lisible au niveau racine
- une séparation plus claire entre orchestration globale et implémentation des briques

## Commandes utiles

```bash
make up
make fmt-check
make validate
make plan-dev
make apply-dev
make output
curl http://localhost:8001/health
make destroy-dev
```

## Intention pédagogique

Le but n'est pas de montrer une architecture de modules sophistiquée.

Le but est de montrer :

- quand un module devient utile
- comment garder le projet lisible
- pourquoi deux modules bien choisis valent mieux qu'une sur-factorisation précoce
