#!/usr/bin/env bash
set -euo pipefail

API_URL="${1:-http://localhost:8000}"

echo "[1/3] Verification de LocalStack"
curl -s http://localhost:4566/_localstack/health
echo

echo "[2/3] Verification de l'API d'inference"
curl -s "${API_URL}/health"
echo

echo "[3/3] Verification d'un predict minimal"
curl -s -X POST "${API_URL}/predict" \
  -H "Content-Type: application/json" \
  -d '{"amount":1499.0,"merchant_category":"travel","hour_of_day":2,"country":"FR","is_international":true,"device_risk_score":0.91}'
echo
