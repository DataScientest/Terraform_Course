# Structure cible du repo

## Vue d'ensemble

Le repo est organisé pour suivre la progression du cours tout en restant crédible d'un point de vue MLOps.

```txt
Terraform_Course/
├── README.md
├── docker/
├── docs/
│   └── STRUCTURE.md
├── localstack/
├── terraform/
│   ├── environments/
│   │   ├── dev/
│   │   └── prod/
│   ├── modules/
│   │   ├── artifact_store/
│   │   └── inference_service/
│   └── scripts/
└── tests/
```

## Rôle de chaque dossier

### `docker/`

Contiendra ce qui sert au runtime applicatif local :

- image ou Dockerfile de l'API d'inférence
- éventuellement configuration associée au conteneur

### `localstack/`

Contiendra la configuration nécessaire pour lancer LocalStack proprement dans le lab.

Objectif :

- simuler des ressources AWS-like
- en particulier un bucket de type S3 pour les artefacts du modèle

### `terraform/`

Contiendra le coeur du code Terraform.

Ce dossier sera amené à évoluer au fil des branches, par exemple avec :

- `versions.tf`
- `provider.tf`
- `main.tf`
- `variables.tf`
- `outputs.tf`

### `terraform/environments/`

Contiendra les déclinaisons d'environnement du produit.

Exemples attendus plus tard :

- `dev.tfvars`
- `prod.tfvars`

### `terraform/modules/`

Contiendra seulement des modules simples et utiles si la factorisation devient réellement pertinente.

Pour l'instant, les deux briques pressenties sont :

- `artifact_store/`
- `inference_service/`

### `terraform/scripts/`

Contiendra des scripts d'aide pour le lab si besoin.

Exemples possibles plus tard :

- script de validation locale
- wrapper de démarrage du lab

### `tests/`

Contiendra les vérifications simples du use case.

Exemple attendu plus tard :

- smoke test sur `curl http://localhost:8000/health`

### `docs/`

Contiendra les notes techniques internes au use case.

## Règle importante

Le repo doit rester compréhensible à chaque étape.

Autrement dit :

- on n'ajoute pas de dossiers "au cas où"
- on ne crée pas trop tôt des modules inutiles
- on fait grandir la structure au rythme du produit et du cours

## Prochaine étape

La prochaine vraie branche de travail sera :

- `00-setup-local`

Elle devra rendre l'environnement local utilisable avant toute première ressource Terraform.
