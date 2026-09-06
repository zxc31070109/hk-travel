#!/bin/bash
set -e

# Change to project root directory
cd "$(dirname "$0")"

echo "=========================================="
echo "🇭🇰 HK Travel - Git 一鍵同步腳本 (macOS/Linux)"
echo "=========================================="

echo "[1/3] 正在加入變更至暫存區 (git add -A)..."
git add -A

echo "[2/3] 正在提交版本 (git commit)..."
COMMIT_MSG="${1:-Auto update HK Travel App}"
git commit -m "$COMMIT_MSG" || echo "沒有需要提交的變更。"

echo "[3/3] 正在推送到 GitHub (git push origin main)..."
git push origin main

echo ""
echo "=========================================="
echo "✅ 推送成功！"
echo "🌐 GitHub Pages 線上版: https://zxc31070109.github.io/hk-travel/"
echo "=========================================="
