#!/bin/bash
echo "🚀 开始清理 macOS 浏览器缓存和临时文件（保留登录状态）..."

# -------- Safari --------
echo "🟢 清理 Safari 缓存..."
rm -rf ~/Library/Caches/com.apple.Safari/*
#rm -rf ~/Library/Safari/History/*          # 清除历史记录，可选
rm -rf ~/Library/Safari/Databases/*        # 临时数据库
rm -rf ~/Library/Safari/LocalStorage/*     # 本地存储文件

# -------- Chrome --------
echo "🟢 清理 Chrome 缓存..."
rm -rf ~/Library/Caches/Google/Chrome/*

# -------- Edge --------
echo "🟢 清理 Edge 缓存..."
rm -rf ~/Library/Caches/Microsoft\ Edge/*

# -------- Firefox --------
echo "🟢 清理 Firefox 缓存..."
rm -rf ~/Library/Caches/Firefox/Profiles/*/cache2/*
rm -rf ~/Library/Caches/Firefox/Profiles/*/jumpListCache/*

# -------- Tor Browser --------
echo "🟢 清理 Tor Browser 缓存..."
rm -rf ~/Library/Caches/TorBrowser-Data/*

echo "🎉 浏览器缓存清理完成！"
