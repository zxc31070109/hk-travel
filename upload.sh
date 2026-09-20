#!/bin/bash

# Navigate to repository directory
cd "$(dirname "$0")"

echo "=================================================="
echo "🚀 HK Travel - GitHub Sync & Upload"
echo "=================================================="

# 1. Add changes
echo ""
echo "📦 [1/3] Staging changes (git add -A)..."
git add -A

# 2. Commit changes
if git diff --cached --quiet; then
    echo "ℹ️  [2/3] No new local changes to commit (already committed)."
else
    MSG="${1:-Update HK Travel schedule}"
    echo "📝 [2/3] Committing changes: '$MSG'..."
    git commit -m "$MSG"
fi

# 3. Push to GitHub
echo ""
echo "⬆️  [3/3] Pushing to GitHub (origin main)..."
if git push origin main; then
    echo ""
    echo "=================================================="
    echo "🎉 SUCCESS! Uploaded to GitHub successfully!"
    echo "📱 Mobile Live Site: https://zxc31070109.github.io/hk-travel/"
    echo "📁 Repository:      https://github.com/zxc31070109/hk-travel"
    echo "=================================================="
else
    echo ""
    echo "=================================================="
    echo "⚠️  PUSH FAILED (Network Connection Issue)"
    echo "=================================================="
    echo "Tips to resolve connection issue:"
    echo "1. Ensure your internet connection is active."
    echo "2. If you are using a VPN / Proxy (e.g., Clash / Surge):"
    echo "   Run this command in Terminal to route git through your proxy:"
    echo "   git config --global http.proxy http://127.0.0.1:7890"
    echo "   (or port 1087 / 10808 depending on your software)"
    echo "3. Then re-run: ./upload.sh"
    echo "=================================================="
    exit 1
fi
