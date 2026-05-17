@echo off
title One API Relay

echo [1/2] Starting One API...
start /B one-api.exe --port 3000
timeout /t 3 /nobreak >nul

echo [2/2] Starting ngrok tunnel...
start /B ngrok.exe http 3000
timeout /t 3 /nobreak >nul

echo.
echo One API:    http://localhost:3000
echo ngrok:     http://localhost:4040
echo.
echo Waiting for ngrok URL...
timeout /t 5 /nobreak >nul

echo.
echo Done! Press any key to stop all services.
pause >nul

echo Stopping...
taskkill /f /im one-api.exe >nul 2>&1
taskkill /f /im ngrok.exe >nul 2>&1
echo All services stopped.
timeout /t 2 /nobreak >nul
