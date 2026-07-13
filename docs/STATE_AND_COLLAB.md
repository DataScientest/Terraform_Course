# State et collaboration

## Ce que ce chapitre veut montrer

Le state Terraform n'est pas un détail technique secondaire.

Il sert à mémoriser :

- les ressources gérées
- leur identifiant réel
- les outputs
- certaines relations entre objets

## Pourquoi le state local pose vite problème

Avec un state local :

- une seule machine voit l'état complet le plus récent
- il est facile d'écraser un changement sans s'en rendre compte
- un fichier sensible peut être commité par erreur

## Ce que le repo propose dans cette branche

- un `Makefile` pour stabiliser les commandes usuelles
- un exemple de backend S3-like dans `terraform/backend.localstack.tf.example`
- une discipline minimale autour de `fmt`, `validate`, `plan`, `apply`

## Important

L'exemple de backend LocalStack est pédagogique.

Il montre le pattern d'un backend distant, mais ne doit pas être lu comme une promesse d'équivalence complète avec un backend AWS réel en production.
