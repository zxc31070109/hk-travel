@echo off
chcp 65001 >nul
title Push to GitHub
cd /d "%~dp0"
git add -A
git commit -m "Auto update HK Travel App"
git push origin main
echo.
if %ERRORLEVEL% EQU 0 (
    echo 成功
) else (
    echo 失敗
)
echo.
pause
