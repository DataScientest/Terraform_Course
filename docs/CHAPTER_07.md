# Chapitre bonus - Ansible

## Objectif

Ajouter une couche d'orchestration post-provisioning au use case.

## Idee generale

Terraform continue de decrire et de provisionner l'infrastructure.

Ansible vient ensuite pour enchaîner proprement :

- demarrage du lab
- initialisation Terraform
- validation
- apply
- verification de l'API
- teardown

## Commandes utiles

```bash
make ansible-deploy
make ansible-destroy
```
