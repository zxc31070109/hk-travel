@echo off
title Push to GitHub
cd /d "%~dp0"

echo [1/3] Adding files to git...
git add -A

echo [2/3] Committing changes...
git commit -m "Auto update HK Travel App"

echo [3/3] Pushing to GitHub...
git push origin main

echo ====================================================
echo SUCCESS
echo URL: https://zxc31070109.github.io/hk-travel/
echo ====================================================
echo.
pause
