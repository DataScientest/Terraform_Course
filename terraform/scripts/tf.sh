#!/usr/bin/env bash
set -euo pipefail

docker-compose exec -T terraform terraform "$@"
