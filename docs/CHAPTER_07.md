# Chapitre bonus - Ansible

## Objectif

Ajouter une couche d'orchestration post-provisioning au use case.

## Pre-requis Ansible

Ce bonus a ete verifie avec `ansible-core >= 2.15` et `< 2.18`.

Si `ansible-playbook` n'est pas disponible, vous pouvez installer une version compatible :

- Linux / WSL2 : `python3 -m pip install --user "ansible-core>=2.15,<2.18"`
- macOS : `python3 -m pip install --user "ansible-core>=2.15,<2.18"`

Puis controlez la compatibilite avec :

```bash
make ansible-check
```

Si vous travaillez sur Windows, il vaut mieux executer ce bonus depuis WSL2 plutot que depuis PowerShell natif.

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
make ansible-check
make ansible-deploy
make ansible-destroy
```
