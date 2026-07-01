# Setup local

## Lancer le lab

```bash
git clone https://github.com/DataScientest/Terraform_Course.git
cd Terraform_Course
docker compose up --build -d
```

## Verifier Terraform dans le conteneur

```bash
docker compose exec terraform terraform version
```

## Verifier LocalStack

```bash
curl http://localhost:4566/_localstack/health
```

## Verifier l'API

```bash
curl http://localhost:8000/health
```

## Verifier un predict

```bash
curl -X POST http://localhost:8000/predict \
  -H "Content-Type: application/json" \
  -d '{"amount":1499.0,"merchant_category":"travel","hour_of_day":2,"country":"FR","is_international":true,"device_risk_score":0.91}'
```

## Arreter le lab

```bash
docker compose down
```
