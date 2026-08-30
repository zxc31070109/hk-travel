@echo off
chcp 65001 >nul
title Push to GitHub
cd /d "%~dp0"
git add .
git commit -m "Update HK Travel App"
git push -u origin main
echo.
echo 成功
echo.
pause
