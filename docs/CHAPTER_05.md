# Chapitre 5 - Structure et modules

## Objectif

Rendre le projet Terraform plus maintenable sans tomber dans la sur-abstraction.

## Etat de depart de la branche

Le repo est encore volontairement plat :

- le bucket S3 est toujours declare au niveau racine
- l'image Docker est toujours declaree au niveau racine
- le conteneur Docker est toujours declare au niveau racine

Cette branche sert justement de point de depart pour faire la refactorisation au lieu de la lire deja terminee.

## Travail attendu

- extraire d'abord le stockage et le runtime dans des modules simples sans changer le comportement
- relire le plan pour verifier que la refactorisation ne modifie pas le produit
- comprendre quand un `moved` ou un `terraform state mv` devient utile pendant une refactorisation
- ajouter ensuite un second bucket `exports` via `for_each`

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
- comment separer une refactorisation structurelle d'un changement de comportement
- pourquoi deux modules bien choisis valent mieux qu'une sur-factorisation precoce
- comment un `for_each` peut faire grandir une brique sans dupliquer le code
