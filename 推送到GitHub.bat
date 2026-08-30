@echo off
chcp 65001 >nul
title 推送到 GitHub (zxc31070109/hk-travel)
echo ====================================================
echo   正在將最新修訂內容自動推送到 GitHub...
echo ====================================================
echo.

cd /d "%~dp0"

echo [1/3] 檢查與加入所有變更檔案 (git add -A)...
git add -A

set "commit_msg="
set /p commit_msg="請輸入本次更新說明 (直接按 Enter 將使用預設說明): "
if not defined commit_msg set "commit_msg=Update HK Travel App"

echo.
echo [2/3] 提交變更 (git commit)...
git commit -m "%commit_msg%"

echo.
echo [3/3] 推送到 GitHub (git push)...
git push origin main

echo.
if %ERRORLEVEL% EQU 0 (
    echo ====================================================
    echo   成功
    echo   推送成功！
    echo   手機瀏覽網址：https://zxc31070109.github.io/hk-travel/
    echo ====================================================
) else (
    echo ====================================================
    echo   [失敗] 推送過程中發生錯誤，請檢查輸出訊息。
    echo ====================================================
)
echo.
pause
