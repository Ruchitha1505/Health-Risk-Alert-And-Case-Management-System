@echo off
title Launch CLINEXA Full Stack
echo ====================================================
echo Launching CLINEXA Full Stack Application
echo ====================================================
cd /d "%~dp0"
start "CLINEXA Backend (:8000)" run_backend.bat
start "CLINEXA Frontend (:5173)" run_frontend.bat
echo Backend and Frontend launched in dedicated windows.
echo Opening browser to http://localhost:5173 ...
timeout /t 3 >nul
start http://localhost:5173
