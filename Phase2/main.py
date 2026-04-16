from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import re
from typing import List

app = FastAPI(title="JobShield AI Backend")

# CORS support for Flutter/Web frontend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class JobRequest(BaseModel):
    text: str

class JobResponse(BaseModel):
    is_fake: bool
    confidence: int
    reasons: List[str]

# Core detection patterns as requested
DETECTION_RULES = [
    {
        "keywords": ["registration fee", "payment required", "pay to apply", "security deposit"],
        "reason": "Payment requested",
        "weight": 40
    },
    {
        "keywords": ["urgent hiring", "immediate start", "start today", "hiring now"],
        "reason": "Suspicious urgency",
        "weight": 15
    },
    {
        "keywords": ["gmail email", "@gmail.com", "@outlook.com", "@yahoo.com"],
        "reason": "Use of personal email domain",
        "weight": 20
    },
    {
        "keywords": ["whatsapp only", "contact on whatsapp", "message us on whatsapp"],
        "reason": "WhatsApp-only communication",
        "weight": 20
    },
    {
        "keywords": ["unrealistic salary", "high pay for no experience", "earn 1000 daily"],
        "reason": "Unrealistic salary expectations",
        "weight": 30
    }
]

@app.get("/")
async def health_check():
    return {"status": "online", "message": "JobShield AI Backend - Guarding your career."}

@app.post("/analyze-job", response_model=JobResponse)
async def analyze_job(request: JobRequest):
    text = request.text.lower().strip()
    
    if not text:
        raise HTTPException(status_code=400, detail="Job description is empty")

    reasons = []
    total_score = 0
    
    for rule in DETECTION_RULES:
        for keyword in rule["keywords"]:
            if keyword in text:
                reasons.append(rule["reason"])
                total_score += rule["weight"]
                break  # Only add the reason once per rule category

    # Basic logic to determine if it's fake
    # Scale confidence to 0-100
    confidence = min(total_score, 100)
    
    # Threshold for fake detection
    is_fake = confidence >= 30

    return {
        "is_fake": is_fake,
        "confidence": confidence,
        "reasons": reasons
    }

if __name__ == "__main__":
    import uvicorn
    # Ready to run on port 8000
    uvicorn.run(app, host="0.0.0.0", port=8000)
