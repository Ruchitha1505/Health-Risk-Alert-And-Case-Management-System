@echo off
title CLINEXA Backend Server (FastAPI)
echo ====================================================
echo Starting CLINEXA Backend on http://localhost:8000
echo ====================================================
cd /d "%~dp0"
py -m uvicorn backend.app.main:app --host 0.0.0.0 --port 8000 --reload
pause
