Set-Location -Path $PSScriptRoot

Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "  正在將最新變更自動推送到 GitHub..." -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "[1/3] 檢查與加入變更檔案 (git add -A)..." -ForegroundColor Yellow
git add -A

Write-Host ""
$commitMsg = Read-Host "請輸入本次更新說明 (直接按 Enter 將使用預設說明)"
if ([string]::IsNullOrWhiteSpace($commitMsg)) {
    $commitMsg = "Auto update HK Travel App"
}

Write-Host ""
Write-Host "[2/3] 提交變更 (git commit)..." -ForegroundColor Yellow
git commit -m $commitMsg

Write-Host ""
Write-Host "[3/3] 推送到 GitHub (git push)..." -ForegroundColor Yellow
git push origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "====================================================" -ForegroundColor Green
    Write-Host "  成功" -ForegroundColor Green
    Write-Host "  推送成功！" -ForegroundColor Green
    Write-Host "  手機瀏覽網址：https://zxc31070109.github.io/hk-travel/" -ForegroundColor Green
    Write-Host "====================================================" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "====================================================" -ForegroundColor Red
    Write-Host "  [錯誤] 推送失敗，請檢查網路連線或 Git 設定。" -ForegroundColor Red
    Write-Host "====================================================" -ForegroundColor Red
}

Write-Host ""
Read-Host "按 Enter 鍵結束..."
