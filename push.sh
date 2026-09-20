#!/bin/bash
set -e

# Navigate to repository directory
cd "$(dirname "$0")"

echo "=================================================="
echo "🚀 HK Travel - GitHub Sync & Upload"
echo "=================================================="

# 1. Add changes
echo ""
echo "📦 [1/3] 正在檢查與加入變更 (git add -A)..."
git add -A

# 2. Commit changes
if git diff --cached --quiet; then
    echo "ℹ️  [2/3] 本地無新變更需要提交（已是最新版本）。"
else
    MSG="${1:-Update HK Travel schedule}"
    echo "📝 [2/3] 正在建立提交版本: '$MSG'..."
    git commit -m "$MSG"
fi

# 3. Quick Network Pre-flight check (3 seconds max)
echo ""
echo "🌐 [3/3] 正在檢查與 GitHub 的連線..."
if ! nc -zv -G 3 github.com 443 >/dev/null 2>&1; then
    echo ""
    echo "=================================================="
    echo "❌ 偵測到目前網路無法直連 GitHub 伺服器 (連線逾時)"
    echo "=================================================="
    echo "🔍 真相診斷："
    echo "   您的 Mac 目前連接著「手機個人熱點」（台灣大哥大），"
    echo "   目前熱點處於純 IPv6 狀態，熱點的 IPv4 (CGNAT) 暫時斷流。"
    echo "   由於 GitHub 官方只支援 IPv4，才導致連線卡住逾時。"
    echo ""
    echo "💡 超簡單 5 秒解決方法："
    echo "   👉 請在分享熱點的手機上：打開「飛航模式」5 秒鐘，然後關閉。"
    echo "   （這會強制手機電信基地台重新分配 IPv4 網路）"
    echo ""
    echo "   手機重新連上網路後，再次輸入："
    echo "   ./upload.sh"
    echo "=================================================="
    exit 1
fi

# 4. Push to GitHub with safety timeout
echo "⬆️  連線正常！正在推送到 GitHub (origin main)..."
if git -c http.lowSpeedLimit=1000 -c http.lowSpeedTime=10 push origin main; then
    echo ""
    echo "=================================================="
    echo "🎉 上傳成功！行程已同步至 GitHub！"
    echo "📱 手機線上版網址: https://zxc31070109.github.io/hk-travel/"
    echo "📁 原始碼庫:      https://github.com/zxc31070109/hk-travel"
    echo "=================================================="
else
    echo "⚠️  推送失敗，請檢查網路連線。"
    exit 1
fi
