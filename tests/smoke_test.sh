#!/usr/bin/env bash
set -euo pipefail

API_URL="${1:-http://localhost:8000}"

echo "[1/4] Verification de LocalStack"
LOCALSTACK_HEALTH="$(curl --fail --silent --show-error --retry 10 --retry-delay 2 --retry-connrefused --max-time 10 http://localhost:4566/_localstack/health)"
python3 - <<'PY' "$LOCALSTACK_HEALTH"
import json
import sys

payload = json.loads(sys.argv[1])
s3_status = payload.get("services", {}).get("s3")
if s3_status not in {"available", "running"}:
    raise SystemExit(f"LocalStack S3 not ready: {s3_status!r}")
print(json.dumps({"s3": s3_status}, ensure_ascii=False))
PY

echo "[2/4] Verification de l'API d'inference"
HEALTH_JSON="$(curl --fail --silent --show-error --retry 15 --retry-delay 2 --retry-connrefused --max-time 10 "${API_URL}/health")"
python3 - <<'PY' "$HEALTH_JSON"
import json
import sys

payload = json.loads(sys.argv[1])
if payload.get("status") != "ok":
    raise SystemExit(f"Unexpected health status: {payload!r}")
print(json.dumps(payload, ensure_ascii=False))
PY

echo "[3/4] Verification d'un predict minimal"
PREDICT_JSON="$(curl --fail --silent --show-error --retry 5 --retry-delay 2 --retry-connrefused --max-time 10 -X POST "${API_URL}/predict" \
  -H "Content-Type: application/json" \
  -d '{"amount":1499.0,"merchant_category":"travel","hour_of_day":2,"country":"FR","is_international":true,"device_risk_score":0.91}')"
python3 - <<'PY' "$PREDICT_JSON"
import json
import sys

payload = json.loads(sys.argv[1])
score = payload.get("fraud_score")
if score is None:
    raise SystemExit(f"Missing fraud_score in payload: {payload!r}")
if not isinstance(score, (int, float)):
    raise SystemExit(f"fraud_score is not numeric: {payload!r}")
print(json.dumps(payload, ensure_ascii=False))
PY

echo "[4/4] Verification d'un echec sur route inexistante"
NOT_FOUND_STATUS="$(curl --silent --show-error --output /dev/null --write-out '%{http_code}' "${API_URL}/does-not-exist")"
if [ "$NOT_FOUND_STATUS" != "404" ]; then
  printf 'Expected 404 on missing route, got %s\n' "$NOT_FOUND_STATUS" >&2
  exit 1
fi
