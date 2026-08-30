@echo off
chcp 65001 >nul
title Hong Kong Itinerary App - Start
echo Launching HK Travel Itinerary App...
cd /d "%~dp0"

IF NOT EXIST "node_modules" (
    echo Installing dependencies...
    call npm install
)

echo Starting dev server...
call npm run dev
pause
