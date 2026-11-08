# CLINEXA — Health Risk Alert & Case Management System Using Machine Learning

[![Python](https://img.shields.io/badge/Python-3.14-blue.svg)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.128-009688.svg)](https://fastapi.tiangolo.com/)
[![React](https://img.shields.io/badge/React-19.2-61dafb.svg)](https://react.dev/)
[![Scikit-Learn](https://img.shields.io/badge/Scikit--Learn-1.9-f7931e.svg)](https://scikit-learn.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-clinexa__db-336791.svg)](https://www.postgresql.org/)
[![License](https://img.shields.io/badge/License-Academic%20Final%20Year-green.svg)]()

> **CLINEXA** is a complete, modular, end-to-end clinical decision-support system that evaluates individual health profiles across **8 major disease conditions** using machine learning models trained on **genuine Kaggle and UCI benchmark datasets**, provides automated risk categorization, generates real-time SMS alerts to verified mobile numbers, and supports structured clinical case management.

---

## 🌟 Key Features

1. **8 Authentic Machine Learning Disease Models**:
   - **Type 2 Diabetes** (GradientBoosting, ROC-AUC 83.1%)
   - **Cardiovascular / Heart Disease** (RandomForest, ROC-AUC 91.1%)
   - **Cerebrovascular Stroke** (LogisticRegression with Class-Weighting, ROC-AUC 83.9%)
   - **Chronic Hypertension** (RandomForest, Accuracy 99.3%, ROC-AUC 1.000)
   - **Chronic Kidney Disease (CKD)** (LogisticRegression, Accuracy 98.8%, ROC-AUC 1.000)
   - **Hepatic / Liver Disease** (Support Vector Machine, ROC-AUC 84.4%)
   - **Obesity & Weight Strain** (RandomForest Multi-Class, Accuracy 94.8%)
   - **Thyroid Dysfunction / Hypothyroidism** (GradientBoosting, Accuracy 99.1%, ROC-AUC 99.8%)
2. **Zero Synthetic Data Fabrication**: Every model is trained and tested on genuine clinical datasets downloaded into the workspace.
3. **Real-Time Automated SMS Alerts**: Automatic SMS notifications dispatched to verified mobile numbers via Twilio, MSG91 (DLT compliant), or the integrated test gateway with 30-minute deduplication cooldowns.
4. **Clinical Case Management & Follow-Ups**: Escalation of high-risk findings into trackable clinical cases, reviewer audit logs, scheduled follow-up dates, and SMS reminders.
5. **Modern Responsive Web UI**: React 19 + Vite + Tailwind CSS responsive interface preserving the clinical Arena AI design language.
6. **Robust Relational Data Model**: PostgreSQL database (`clinexa_db`) with SQLAlchemy ORM and SQLite fallback for local development.
7. **Role-Based Security**: Cryptographic bcrypt password hashing, JWT bearer token authentication, and administrator route guards.

---

## 📁 Repository Structure

```
CLINEXA/
├── frontend/                  # React + Vite + Tailwind CSS Frontend
│   ├── src/
│   │   ├── components/        # Navbar, DashboardCard, RiskCard, AlertCard, ToastContainer
│   │   ├── pages/             # Dashboard, Assessment, Results, Alerts, Cases, History, Admin
│   │   ├── services/          # Axios API clients for Auth, Predictions, Alerts, Cases, SMS
│   │   ├── context/           # AppContext state management
│   │   └── App.tsx            # Main application router
│   └── package.json
│
├── backend/                   # FastAPI Backend
│   ├── app/
│   │   ├── api/               # auth, health, prediction, alert, case, notification, dashboard
│   │   ├── schemas/           # Pydantic v2 validation models
│   │   ├── services/          # Business logic services
│   │   ├── config/            # JWT security, CORS, and settings
│   │   └── main.py            # FastAPI entry point
│   └── requirements.txt
│
├── ml/                        # Machine Learning Subsystem
│   ├── datasets/
│   │   ├── raw/               # Downloaded authentic Kaggle/UCI CSVs (8 datasets)
│   │   ├── processed/         # Stratified train/test splits
│   │   └── dataset_sources.csv# Dataset provenance and license register
│   ├── preprocessing/         # Individual preprocessing pipelines for all 8 diseases
│   ├── training/              # Training & algorithm comparison scripts
│   ├── testing/               # Independent verification tests for all 8 models
│   ├── evaluation/            # Confusion matrices, ROC-AUC plots, metrics suite
│   ├── models/                # Saved .joblib model pipelines & confusion matrix figures
│   └── model_registry.py      # Unified inference engine & risk classification
│
├── database/                  # PostgreSQL Database
│   ├── connection.py          # SQLAlchemy engine with SQLite development fallback
│   ├── models.py              # Relational models (Users, Vitals, Labs, Cases, Alerts, SMS)
│   ├── init_db.sql            # PostgreSQL database creation script
│   └── schema.sql             # Full PostgreSQL DDL definitions
│
├── notifications/             # Real-Time SMS & OTP Subsystem
│   ├── sms_provider.py        # Twilio, MSG91, and Simulated Test Gateway implementations
│   ├── sms_service.py         # Phone normalization, masking, and routing
│   ├── otp_service.py         # Cryptographic 6-digit OTP verification
│   ├── notification_service.py# High-risk alert SMS trigger with cooldown
│   └── notification_templates.py # Approved message templates
│
├── tests/                     # Automated Test Suites
│   ├── backend/               # FastAPI API endpoint integration tests
│   ├── machine_learning/      # ML inference and registry tests
│   ├── sms/                   # OTP and SMS gateway tests
│   ├── database/              # Relational CRUD and foreign key tests
│   └── integration/           # Complete 20-step end-to-end acceptance test
│
├── scripts/                   # Master Execution Scripts
│   ├── download_datasets.py   # Automated Kaggle/UCI downloader
│   ├── preprocess_all.py      # Master preprocessing runner
│   ├── train_all_models.py    # Master model trainer
│   ├── evaluate_all_models.py # Master evaluation runner
│   └── run_project.py         # One-click concurrent service orchestrator
│
├── docs/                      # Technical Documentation
│   ├── system_architecture.md # Architectural specifications & Mermaid diagrams
│   ├── database_design.md     # Relational ERD and schema dictionary
│   ├── api_documentation.md   # Endpoint contracts & payload examples
│   ├── ml_documentation.md    # Model benchmarks & training methodology
│   ├── sms_integration.md     # Gateway configuration & cooldown policies
│   └── installation_guide.md  # Detailed setup instructions
│
├── .gitignore
├── requirements.txt
└── README.md
```

---

## 🚀 Quick Start Guide

### 1. Install Dependencies
```bash
py -m pip install -r requirements.txt
cd frontend && npm install && cd ..
```

### 2. Verify Datasets & Train Models
```bash
py scripts/download_datasets.py
py scripts/preprocess_all.py
py scripts/train_all_models.py
```

### 3. Launch Application
```bash
py scripts/run_project.py
```
- **Frontend**: [http://localhost:5173](http://localhost:5173)
- **FastAPI Backend**: [http://localhost:8000](http://localhost:8000)
- **Swagger Documentation**: [http://localhost:8000/docs](http://localhost:8000/docs)

### 4. Run Acceptance Tests
```bash
py tests/integration/test_end_to_end_workflow.py
```

---

## 📊 Model Evaluation Summary

| Condition | Best Algorithm | Test Accuracy | F1-Score | ROC-AUC | Cross-Validation Score |
|---|---|---|---|---|---|
| **Diabetes** | GradientBoosting | 73.38% | 0.5941 | **0.8306** | 0.8138 |
| **Heart Disease** | RandomForest | 81.97% | 0.8493 | **0.9113** | 0.9092 |
| **Stroke Risk** | LogisticRegression | 73.87% | 0.2305 | **0.8394** | 0.8397 |
| **Hypertension** | RandomForest | **99.31%** | 0.9937 | **1.0000** | 1.0000 |
| **Kidney Disease** | LogisticRegression | **98.75%** | 0.9899 | **1.0000** | 1.0000 |
| **Liver Disease** | Support Vector Machine | 69.23% | 0.7429 | **0.8441** | 0.7140 |
| **Obesity Levels** | RandomForest | **94.80%** | 0.9477 | **0.9947** | 0.9419 |
| **Thyroid Disease** | GradientBoosting | **99.05%** | 0.9062 | **0.9976** | 0.9904 |

---

## 🛡️ Clinical Disclaimer
CLINEXA is an academic engineering decision-support prototype designed for preventive health monitoring. Predictions represent statistical machine learning estimates and are not a substitute for formal diagnostic tests, clinical judgment, or medical advice by licensed physicians.
