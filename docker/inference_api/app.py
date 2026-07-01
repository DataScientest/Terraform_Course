from fastapi import FastAPI
from pydantic import BaseModel
import os


app = FastAPI(title="Fraud Scoring API")


class FraudRequest(BaseModel):
    amount: float
    merchant_category: str
    hour_of_day: int
    country: str
    is_international: bool
    device_risk_score: float


@app.get("/health")
def health():
    return {"status": "ok", "model_version": os.getenv("MODEL_VERSION", "unknown")}


@app.post("/predict")
def predict(payload: FraudRequest):
    # Very small deterministic rule for the course setup branch.
    score = min(0.99, max(0.01, (payload.amount / 2000.0) + (0.3 if payload.is_international else 0.0) + payload.device_risk_score / 2))
    return {
        "fraud_score": round(score, 3),
        "model_version": os.getenv("MODEL_VERSION", "unknown"),
    }
