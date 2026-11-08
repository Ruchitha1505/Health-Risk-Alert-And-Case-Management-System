@echo off
title CLINEXA Frontend Server (Vite)
echo ====================================================
echo Starting CLINEXA Frontend on http://localhost:5173
echo ====================================================
cd /d "%~dp0\frontend"
npm run dev
pause
