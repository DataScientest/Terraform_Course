#!/usr/bin/env bash
set -euo pipefail

echo "[1/2] Verification de LocalStack"
curl -s http://localhost:4566/_localstack/health
echo

echo "[2/2] Verification de l'API d'inference"
curl -s http://localhost:8000/health
echo
