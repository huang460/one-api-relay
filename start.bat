@echo off
title One API Relay

echo [1/2] Starting New API...
start /B new-api.exe --port 3000
timeout /t 3 /nobreak >nul

echo [2/2] Starting Cloudflare Tunnel...
start /B cloudflared.exe tunnel --url http://localhost:3000
timeout /t 3 /nobreak >nul

echo.
echo Local:      http://localhost:3000
echo.
echo Cloudflare Tunnel starting... check URL above.
echo.
echo Press any key to stop all services.
pause >nul

echo Stopping...
taskkill /f /im new-api.exe >nul 2>&1
taskkill /f /im cloudflared.exe >nul 2>&1
echo All services stopped.
timeout /t 2 /nobreak >nul
